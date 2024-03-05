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

    //TABS
    document.querySelectorAll('.tabs a').forEach(function(tabLink) {
        tabLink.addEventListener('click', function(event) {
            event.preventDefault();
            document.querySelectorAll('.tabs a').forEach(function(link) {
                link.classList.remove('active');
            });
            document.querySelectorAll('.tab-content').forEach(function(content) {
                content.classList.remove('active');
            });
    
            var tabId = tabLink.getAttribute('href');
            tabLink.classList.add('active');
            document.querySelector(tabId).classList.add('active');
        });
    });

    $(document).ready(function () {
        $('thead th').click(function () {
            var columnIndex = $(this).index();
            var currentOrder = $(this).data('order') || 'asc';
            var newOrder = currentOrder === 'asc' ? 'desc' : 'asc';
            
            $('thead th').removeClass('asc desc');
            $('.arrow').removeClass('asc desc');

            $(this).find('.arrow').removeClass('neutre');
            $(this).find('.arrow').addClass(newOrder);

            $(this).addClass(newOrder);
            $(this).data('order', newOrder);
            sortTable(columnIndex, newOrder);
            updateArrowClasses();
        });
    });

});

function parseDate(dateString) {
    var parts = dateString.split("-");
    return new Date(parts[2], parts[1] - 1, parts[0]);
}
function sortTable(columnIndex, order) {
    var table = $('.table-facture-list');
    var rows = $('tbody tr', table).get();

    rows.sort(function (a, b) {
        var aValue = $(a).children('td').eq(columnIndex).text();
        var bValue = $(b).children('td').eq(columnIndex).text();

        if (columnIndex === 1) { 
            aValue = parseDate(aValue);
            bValue = parseDate(bValue);
        }    

        if (order === 'asc') {
            return aValue > bValue ? 1 : -1;
        } else {
            return bValue > aValue ? 1 : -1;
        }
    });
    $.each(rows, function (index, row) {
        table.children('tbody').append(row);
    });
}

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

function openDetailPopup(idFacture) {
    var popupListeF = document.getElementById('popupDetailF');
    var popupListeFCal = document.getElementById('popupDetailFCal');

    if(popupListeF){
        popupListeF.style.display = 'block';
        document.getElementById('overlayF').style.display = 'block';
    } else {
        popupListeFCal.style.display = 'block';
        document.getElementById('overlay').style.display = 'block';
    }
    

    $.ajax({
        url: `${idFacture}/`,
        method: 'GET',
        success: function(data) {
            $('.detail_date_facture').text(data.date_facture);
            $('.detail_nom_client').text(data.nom_client);
            $('.detail_r_social_fournisseur').text(data.r_social_fournisseur);
            $('.detail_num_facture').text(data.num_facture);
            $('.detail_total_ht').text(data.total_ht);
            $('.detail_total_ttc').text(data.total_ttc);
            $('.detail_methode_paiement').text(data.methode_paiement);
            $('.detail_statut_facture').text(data.statut_facture);
            $('.detail_cat_facture').text(data.cat_facture);
            updateUI(data.statut_facture);
        },
        error: function(error) {
            console.log(error);
        }
    });

    if(popupListeF){
        popupListeF.style.display = 'block';
    } else {
        popupListeFCal.style.display = 'block';
    }
}

function closeDetailPopup() {
    var popupListeF = document.getElementById('popupDetailF');
    var popupListeFCal = document.getElementById('popupDetailFCal');

    if(popupListeF){
        popupListeF.style.display ='none';
        document.getElementById('overlayF').style.display = 'none';
    } else {
        popupListeFCal.style.display = 'none';
        document.getElementById('overlay').style.display = 'none';
    }
    document.getElementById('overlay').style.display = 'none';
}

function updateUI(data) {
    const statutElement = $('.detail_statut_facture')[0]; 
    
    if (data) {
        statutElement.innerHTML = '<span><svg xmlns="http://www.w3.org/2000/svg" width="26" height="26" fill="green" class="bi bi-check2-circle" viewBox="0 0 16 16"><path d="M2.5 8a5.5 5.5 0 0 1 8.25-4.764.5.5 0 0 0 .5-.866A6.5 6.5 0 1 0 14.5 8a.5.5 0 0 0-1 0 5.5 5.5 0 1 1-11 0"/><path d="M15.354 3.354a.5.5 0 0 0-.708-.708L8 9.293 5.354 6.646a.5.5 0 1 0-.708.708l3 3a.5.5 0 0 0 .708 0z"/></svg></span>';
    } else {
        statutElement.innerHTML = '<span><svg xmlns="http://www.w3.org/2000/svg" width="26" height="26" fill="rgb(220, 53, 69)" class="bi bi-x-circle" viewBox="0 0 16 16"><path d="M8 15A7 7 0 1 1 8 1a7 7 0 0 1 0 14m0 1A8 8 0 1 0 8 0a8 8 0 0 0 0 16"/><path d="M4.646 4.646a.5.5 0 0 1 .708 0L8 7.293l2.646-2.647a.5.5 0 0 1 .708.708L8.707 8l2.647 2.646a.5.5 0 0 1-.708.708L8 8.707l-2.646 2.647a.5.5 0 0 1-.708-.708L7.293 8 4.646 5.354a.5.5 0 0 1 0-.708"/></svg></span>';
    }
}


function updateArrowClasses() {
    $('thead th').each(function() {
        var arrowSpan = $(this).find('.arrow');
        if (!arrowSpan.hasClass('asc') && !arrowSpan.hasClass('desc')) {
            arrowSpan.addClass('neutre');
        }
    });
}

