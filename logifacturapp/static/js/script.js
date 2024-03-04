document.addEventListener('DOMContentLoaded', function() {
    //FILTRE
    const forms = document.querySelectorAll('.filter-form');
    for (const form of forms) {
        for(i=0; i<form.length; i++){
            form[i].addEventListener('change', function() {
                form.submit();
            });
        }       
    }
    calendarTodayLoad();

    //TABS
    $(document).ready(function () {
        $(".tabs a").click(function (e) {
            e.preventDefault();
            $(".tabs a").removeClass("active");
            $(".tab-content").removeClass("active");

            var tabId = $(this).attr("href");
            $(this).addClass("active");
            $(tabId).addClass("active");
        });
        
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

function openModal() {
    document.getElementById('myModalEvent').style.display = 'block';
    selectionHourMin();
}

function closeModal() {
    document.getElementById('myModalEvent').style.display = 'none';
}


function eventFormSubmit() {
    document.getElementById('eventForm').addEventListener('submit', function(event) {
        event.preventDefault();

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
    });
}

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

function calendarTodayLoad() {
    var currentDate = new Date();
    var dayOfMonth = currentDate.getDate();
    var month = currentDate.getMonth() + 1; 
    $('.days-list a').removeClass('selected');  
    $('.days-list a[data-value="' + dayOfMonth + '"]').addClass('selected');

    loadDayEvents(dayOfMonth, month)
}

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
                console.log(response.message);
            } else {
                console.error(response.message);
            }
        },
        error: function(error) {
            console.error(error);
        }
    });
}

function openDetailPopup(idFacture) {
    document.getElementById('popupDetailF').style.display = 'block';

    $.ajax({
        url: `${idFacture}/`,
        method: 'GET',
        success: function(data) {
            $('#date_facture').text(data.date_facture);
            $('#nom_client').text(data.nom_client);
            $('#r_social_fournisseur').text(data.r_social_fournisseur);
            $('#num_facture').text(data.num_facture);
            $('#total_ht').text(data.total_ht);
            $('#total_ttc').text(data.total_ttc);
            $('#methode_paiement').text(data.methode_paiement);
            $('#statut_facture').text(data.statut_facture);
            $('#cat_facture').text(data.cat_facture);
            updateUI(data.statut_facture);
        },
        error: function(error) {
            console.log(error);
        }
    });

    // Affichez votre popup
    document.getElementById('popupDetailF').style.display = 'block';
}

function closeDetailPopup() {
    document.getElementById('popupDetailF').style.display = 'none';
}

function updateUI(data) {   
    const statutElement = document.getElementById('statut_facture');
    console.log(statutElement);
    if (data) {
        statutElement.innerHTML = '<span><svg xmlns="http://www.w3.org/2000/svg" width="26" height="26" fill="green" class="bi bi-check2-circle" viewBox="0 0 16 16"><path d="M2.5 8a5.5 5.5 0 0 1 8.25-4.764.5.5 0 0 0 .5-.866A6.5 6.5 0 1 0 14.5 8a.5.5 0 0 0-1 0 5.5 5.5 0 1 1-11 0"/><path d="M15.354 3.354a.5.5 0 0 0-.708-.708L8 9.293 5.354 6.646a.5.5 0 1 0-.708.708l3 3a.5.5 0 0 0 .708 0z"/></svg></span>';
    } else {
        statutElement.innerHTML = '<span><svg xmlns="http://www.w3.org/2000/svg" width="26" height="26" fill="rgb(220, 53, 69)" class="bi bi-x-circle" viewBox="0 0 16 16"><path d="M8 15A7 7 0 1 1 8 1a7 7 0 0 1 0 14m0 1A8 8 0 1 0 8 0a8 8 0 0 0 0 16"/><path d="M4.646 4.646a.5.5 0 0 1 .708 0L8 7.293l2.646-2.647a.5.5 0 0 1 .708.708L8.707 8l2.647 2.646a.5.5 0 0 1-.708.708L8 8.707l-2.646 2.647a.5.5 0 0 1-.708-.708L7.293 8 4.646 5.354a.5.5 0 0 1 0-.708"/></svg></span>';
    }
}