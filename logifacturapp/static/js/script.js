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

  function calendarTodayLoad(){
    var currentDate = new Date();

    var dayOfMonth = currentDate.getDate();
    
    // Notez que getMonth() retourne les mois de 0 à 11, alors ajoutez 1 pour obtenir le mois réel
    var month = currentDate.getMonth() + 1;
    loadDayEvents(dayOfMonth, month)
  }