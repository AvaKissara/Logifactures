document.addEventListener('DOMContentLoaded', function() {
    $(document).ready(function () {
        calendarTodayLoad();
        
        $('.months-list a').on('click', function(e) {
            e.preventDefault();
            var selectedMonth = $(this).data('value');
            var $thisLink = $(this);

            $.ajax({
                url: 'mois/' + selectedMonth + '/',
                method: 'GET',
                success: function(data) {
                    var $data = $(data);
                    var daysContent = $data.find('.days-list').html();
                    $('.months-list a').removeClass('selected');
                    $thisLink.addClass('selected');                
                    $('.days-list').html(daysContent);
                },
                error: function(error) {
                    console.log(error);
                }
            });
        });
        $('.days-list').on('click', 'a', function(e) {
            e.preventDefault();
            var selectedDay = $(this).data('value');
            var selectedMonth = $('.months-list a.selected').data('value');
            var caseSel = $(this);
            $('.days-list a').removeClass('selected');
        
            loadDayEvents(selectedDay, selectedMonth);
        
            caseSel.addClass('selected');
        });
    });
});

function openPopup() {
    document.getElementById('popup-hour').style.display = 'block';
    document.getElementById('overlay').style.display = 'block';
    refreshPopup();    
}

function closePopup() {
    document.getElementById('popup-hour').style.display = 'none';   
    document.getElementById('overlay').style.display = 'none';
    closeModal();
}

function refreshPopup() {
    var selectedMonth = $('.months-list a.selected').data('value');
    var selectedDay = $('.days-list a.selected').data('value');

    $.ajax({
        url: 'jour/' + selectedMonth + '/' + selectedDay + '/',
        method: 'GET',
        success: function(data) {
            var $data = $(data);
            var $dataPerHourContent = $data.find('.events').html();
            var $hourList = $('.events');
            $hourList.empty();

            var $tempDiv = $('<div>').html($dataPerHourContent);   
            $tempDiv.find('.event').each(function() {
                var startHour = parseInt($(this).attr('class').match(/start-(\d+)/)[1]);
                var endHour = parseInt($(this).attr('class').match(/end-(\d+)/)[1]);
    
                if (startHour > 12) {
                    $(this).removeClass('start-' + startHour).addClass('start-' + (startHour - 12));
                }    
                if (endHour > 12) {
                    $(this).removeClass('end-' + endHour).addClass('end-' + (endHour - 12));
                }
            });
            $hourList.append($tempDiv.html());
        },
        error: function(error) {
            console.log(error);
        }
    });   
}

//Ouvre popup formulaire agenda
function openModal() {
    document.getElementById('myModalEvent').style.display = 'block';
    selectionHourMin();  
}

//Ferme popup formulaire agenda
function closeModal() {
    document.getElementById('eventName').value = '';
    document.getElementById('eventDesc').value = '';
    document.getElementById('eventHourDeb').value = '';
    document.getElementById('eventMinDeb').value = '';
    document.getElementById('eventHourEnd').value = '';
    document.getElementById('eventMinEnd').value = '';
    document.getElementById('eventId').value = ''; 
    document.getElementById('myModalEvent').style.display = 'none';
}

//Ajoute ou Modifie event agenda
function eventFormSubmit() {
    var csrftoken = getCookie('csrftoken');
    $('#eventForm').off('submit').on('submit', function(event) {
        event.preventDefault();
        var eventId = $('#eventId').val(); 
        console.log(eventId);
        var eventName = document.getElementById('eventName').value;
        var eventDescription = document.getElementById('eventDesc').value;
        var hourStartTime = document.getElementById('eventHourDeb').value;
        var hourEndTime = document.getElementById('eventHourEnd').value;
        var minStartTime = document.getElementById('eventMinDeb').value;
        var minEndTime = document.getElementById('eventMinEnd').value;
        var eventStartTime = hourStartTime + ":" + minStartTime;
        var eventEndTime = hourEndTime+ ":" + minEndTime;
        var selectedMonth = $('.months-list a.selected').data('value');
        var selectedDay = $('.days-list a.selected').data('value');
        var currentYear = new Date().getFullYear();

        var startDatetime = currentYear + '-' +selectedMonth + '-' + selectedDay+' ' + eventStartTime;
        var endDatetime = currentYear + '-' +selectedMonth + '-' + selectedDay+' ' + eventEndTime;

        if(eventId) {
            var eventData = {
                'id': eventId,
                'title': eventName,
                'description': eventDescription,
                'start_datetime': startDatetime,
                'end_datetime': endDatetime
                
            };
            $.ajax({
                url: 'details_evenement/'+eventId+'/', 
                method: 'POST',  
                headers: {
                    'X-CSRFToken': csrftoken 
                },
                data: eventData,
                success: function(response) {
                    closeModal();
                    refreshPopup();
                    loadDayEvents(selectedDay, selectedMonth);
                },
                error: function(error) {
                    console.log(error);
                }
            });        
        } else {
            var eventData = {
                'title': eventName,
                'description': eventDescription,
                'start_datetime': startDatetime,
                'end_datetime': endDatetime
            };
    
            $.ajax({
                url: 'cree_evenement', 
                method: 'POST',
                data: eventData,
                success: function(response) {
                    closeModal();
                    refreshPopup();
                    loadDayEvents(selectedDay, selectedMonth);
                },
                error: function(error) {
                    console.log(error);
                }
            });        
        }
    });
}



//Charge date du jour dans le calendrier
function loadDayEvents(selectedDay, selectedMonth) { 
    $.ajax({
        url: 'jour/' + selectedMonth + '/' + selectedDay + '/',
        method: 'GET',
        success: function(data) {
            var $data = $(data);
            var dayEventContent = $data.find('.noteList').html();
            var $noteList = $('.noteList');
            $noteList.empty();
            $noteList.append(dayEventContent);

            var dateObj = new Date(new Date().getFullYear(), selectedMonth - 1, selectedDay);
            var dayNames = ['Dimanche', 'Lundi', 'Mardi', 'Mercredi', 'Jeudi', 'Vendredi', 'Samedi'];
            var monthNames = ['Janvier', 'Fevrier', 'Mars', 'Avril', 'Mai', 'Juin', 'Juillet', 'Août', 'Septembre', 'Octobre', 'Novembre', 'Decembre'];

            var dayName = dayNames[dateObj.getDay()];
            var formattedDate = dayName + ' ' + dateObj.getDate() + ' ' + monthNames[dateObj.getMonth()];
            $('.date').text(formattedDate);
        },
        error: function(error) {
            console.log(error);
        }
    });
}

//Selection horaire formulaire agenda
function selectionHourMin() {
    var hours = Array.from({ length: 11 }, (_, i) => i + 8);
    var minutes = Array.from({ length: 60 }, (_, i) => i);

    ['eventHourDeb', 'eventHourEnd'].forEach(function(id) {
        var dropdown = document.getElementById(id);
        hours.forEach(function(hour) {
        var option = new Option(hour < 10 ? '0' + hour : hour, hour);
        dropdown.add(option);
        });
    });

    ['eventMinDeb', 'eventMinEnd'].forEach(function(id) {
        var dropdown = document.getElementById(id);
        minutes.forEach(function(minute) {
        var option = new Option(minute < 10 ? '0' + minute : minute, minute);
        dropdown.add(option);
        });
    });
}

//Charge la date du jour pour le calendrier
function calendarTodayLoad() {
    var currentDate = new Date();
    var dayOfMonth = currentDate.getDate();
    var month = currentDate.getMonth() + 1; 
    $('.days-list a').removeClass('selected');  
    $('.days-list a[data-value="' + dayOfMonth + '"]').addClass('selected');

    loadDayEvents(dayOfMonth, month)
}

//Efface un event dans l'agenda
function deleteEvent(button) {
    var eventId = $(button).data('event-id');
    var selectedMonth = $('.months-list a.selected').data('value');
    var selectedDay = $('.days-list a.selected').data('value');
    console.log(eventId);
    $.ajax({
        url: 'supprimer_evenement/',
        method: 'POST',
        data: { event_id: eventId },
        success: function(response) {
            if (response.success) {
                refreshPopup();
                loadDayEvents(selectedDay, selectedMonth);
            } else {
                console.error(response.message);
            }
        },
        error: function(error) {
            console.error(error);
        }
    });
}

//Récupère une event pour le formulaire de l'agenda
function getEvent(eventId) {
    $.ajax({
        url: 'details_evenement/'+eventId,  
        method: 'GET',
        success: function(response) {
            $('#eventId').val(response.id);
            $('#eventName').val(response.title);
            $('#eventDesc').val(response.description);

            var startDate = new Date(response.start_datetime);
            var endDate = new Date(response.end_datetime);
            $('#eventHourDeb').val(startDate.getHours()-1);
            $('#eventMinDeb').val(startDate.getMinutes());
            $('#eventHourEnd').val(endDate.getHours()-1);
            $('#eventMinEnd').val(endDate.getMinutes());           
        },
        error: function(error) {
            console.log(error);
        }
    });
}