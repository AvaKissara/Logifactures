document.addEventListener('DOMContentLoaded', function() {
    //CALCUL DYNAMIQUE TOTAL HT
    var quantiteFields = document.querySelectorAll('[id^="id_quantite_"]');
    var prixUnitaireFields = document.querySelectorAll('[id^="id_prix_unitaire_"]');
    if(quantiteFields || prixUnitaireFields) {
        quantiteFields.forEach(function(field) {
            field.addEventListener('input', function() {
                calculerTotalHT();
            });
        });
        
        prixUnitaireFields.forEach(function(field) {
            field.addEventListener('input', function() {
                calculerTotalHT();
            });
        });
       
        function calculerTotalHT() {
            var totalHT = 0;
            quantiteFields.forEach(function(quantiteField, index) {
                var prixUnitaireField = prixUnitaireFields[index];
                var quantite = parseFloat(quantiteField.value);
                var prixUnitaire = parseFloat(prixUnitaireField.value);
                if (!isNaN(quantite) && !isNaN(prixUnitaire)) {
                    totalHT += quantite * prixUnitaire;
                }
            });
            document.getElementById('id_total_ht_facture').value = totalHT.toFixed(2);
        }
    }
    
    //CHANGE INPUT DATE EN TEXT POUR PLACEHOLDER
    var datePaieField = document.getElementById('id_date_e_paie_facture');
    var dateFactureField = document.getElementById('id_date_facture');
    var dateFactureField = document.getElementById('id_date_facture');
    if (dateFactureField) {
        dateFactureField.type = 'text'; 
        dateFactureField.placeholder = 'Date de la facture'; 
        dateFactureField.addEventListener('click', function () {
            dateFactureField.type = 'date';
        });
    } 
    if (datePaieField) {
        datePaieField.type = 'text'; 
        datePaieField.placeholder = 'Echeance de paiement'; 
        datePaieField.addEventListener('click', function () {
            datePaieField.type = 'date';
        });
    }

    //CALCUL DYNAMIQUE TOTAL TTC
    var tvaInput = document.getElementById('id_tva_facture');
    var ttcInput = document.querySelector('input[name="total_ttc_facture"]');
    if(tvaInput) {
        tvaInput.addEventListener('input', function () {
            var tva = parseFloat(tvaInput.value) || 0;
            var ht = parseFloat(document.getElementById('id_total_ht_facture').value) || 0;
            var ttc = ht * (1 + tva / 100);
            ttcInput.value = ttc.toFixed(2);
        });
    }

    //FILTRES
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
        //FILTRES
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

    function parseDate(dateString) {
        var parts = dateString.split("-");
        return new Date(parts[2], parts[1] - 1, parts[0]);
}

//Gère tri asc desc pour listes clients, factures, fournisseurs
function sortTable(columnIndex, order) {
    var table = $('.table-facture-list');
    var rows = $('tbody tr', table).get();
    var thDateF = $('#thDateF').text();
    rows.sort(function (a, b) {
        var aValue = $(a).children('td').eq(columnIndex).text();
        var bValue = $(b).children('td').eq(columnIndex).text();
      
        if (columnIndex === 1 && thDateF.trim() === "Date de Facture") {                
            aValue = parseDate(aValue);
            bValue = parseDate(bValue);
            if (order === 'asc') {
                return aValue > bValue ? 1 : -1;
            } else {
                return bValue > aValue ? 1 : -1;
            }           
        }    
        else {
            var comparison = aValue.localeCompare(bValue, undefined, { sensitivity: 'base' });
            if (order === 'asc') {
                return comparison;
            } else {
                return -comparison;
            }
        }       
    });
    $.each(rows, function (index, row) {
        table.children('tbody').append(row);
    });   
}
});

//Ouvre popup detail facture
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
    refreshDetailPopup(idFacture);
}

//Ferme popup detail facture
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
}

//Maj popup detail facture
function refreshDetailPopup(idFacture) {
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
            updateUI(data.statut_facture, idFacture); 
        },
        error: function(error) {
            console.log(error);
        }
    });
}

//Maj flèches tri ASC DESC
function updateUI(data, idFacture) {
    const statutElement = $('.detail_statut_facture')[0];     
    if (data) {
        statutElement.innerHTML = '<span><svg xmlns="http://www.w3.org/2000/svg" width="26" height="26" fill="green" class="bi bi-check2-circle" viewBox="0 0 16 16"><path d="M2.5 8a5.5 5.5 0 0 1 8.25-4.764.5.5 0 0 0 .5-.866A6.5 6.5 0 1 0 14.5 8a.5.5 0 0 0-1 0 5.5 5.5 0 1 1-11 0"/><path d="M15.354 3.354a.5.5 0 0 0-.708-.708L8 9.293 5.354 6.646a.5.5 0 1 0-.708.708l3 3a.5.5 0 0 0 .708 0z"/></svg></span><button class="add-button-event change-button-statut-f"><svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-toggle2-on" viewBox="0 0 16 16"><path d="M7 5H3a3 3 0 0 0 0 6h4a5 5 0 0 1-.584-1H3a2 2 0 1 1 0-4h3.416q.235-.537.584-1"/><path d="M16 8A5 5 0 1 1 6 8a5 5 0 0 1 10 0"/></svg></button>';
    } else {
        statutElement.innerHTML = '<span><svg xmlns="http://www.w3.org/2000/svg" width="26" height="26" fill="rgb(220, 53, 69)" class="bi bi-x-circle" viewBox="0 0 16 16"><path d="M8 15A7 7 0 1 1 8 1a7 7 0 0 1 0 14m0 1A8 8 0 1 0 8 0a8 8 0 0 0 0 16"/><path d="M4.646 4.646a.5.5 0 0 1 .708 0L8 7.293l2.646-2.647a.5.5 0 0 1 .708.708L8.707 8l2.647 2.646a.5.5 0 0 1-.708.708L8 8.707l-2.646 2.647a.5.5 0 0 1-.708-.708L7.293 8 4.646 5.354a.5.5 0 0 1 0-.708"/></svg></span><button class="add-button-event change-button-statut-f"><svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-toggle2-off" viewBox="0 0 16 16"><path d="M9 11c.628-.836 1-1.874 1-3a4.98 4.98 0 0 0-1-3h4a3 3 0 1 1 0 6z"/><path d="M5 12a4 4 0 1 1 0-8 4 4 0 0 1 0 8m0 1A5 5 0 1 0 5 3a5 5 0 0 0 0 10"/></svg></button>';
    }
    statutElement.onclick = function() {
        changeStatutFacture(idFacture);
    };
}

//Vérfie flèches tri ASC DESC
function updateArrowClasses() {
    $('thead th').each(function() {
        var arrowSpan = $(this).find('.arrow');
        if (!arrowSpan.hasClass('asc') && !arrowSpan.hasClass('desc')) {
            arrowSpan.addClass('neutre');
        }
    });
}

//Change statut paiement pour detail facture
function changeStatutFacture(factureId) {
    $.ajax({
        url: 'change_statut_facture/' + factureId +'/',
        method: 'POST',
        headers: {
            'X-CSRFToken': getCookie('csrftoken')
        },
        success: function(data) {
            refreshDetailPopup(factureId)
        },
        error: function(error) {
            console.log(error);
        }
    });
}

//Récupère cookie pour modification event
function getCookie(name) {
    var cookieValue = null;
    if (document.cookie && document.cookie !== '') {
        var cookies = document.cookie.split(';');
        for (var i = 0; i < cookies.length; i++) {
            var cookie = cookies[i].trim();
            if (cookie.substring(0, name.length + 1) === (name + '=')) {
                cookieValue = decodeURIComponent(cookie.substring(name.length + 1));
                break;
            }
        }
    }
    return cookieValue;
}

//Verifie l'adresse du client à l'import
function checkAdresseClient() {
    var checkAdrClientElement = document.getElementById('checkAdrClient');
    var adresseDiffere = checkAdrClientElement.getAttribute('data-value');
    adresseDiffere = JSON.parse(adresseDiffere.toLowerCase());
    if (adresseDiffere) {
        openPopupMajClient();
    } else {
        closePopupMajClient();
    }
}

function openPopupMajClient(){
    var popup = document.getElementById("confirmationClientPopup");
    popup.style.display = "block";
}

function closePopupMajClient(){
    var popup = document.getElementById("confirmationClientPopup");
    popup.style.display = "none";   
}

function majInfoClient(idClient) {
    var newAdrVilleClient = document.getElementById('newAdrVilleClient').innerHTML;
    var newAdrClient = document.getElementById('newAdrClient').innerHTML;
    var newAdr2Client = document.getElementById('newAdr2Client').innerHTML;

    $.ajax({
        type: 'POST',
        url: 'mise_a_jour/client/'+ idClient +'/',
        headers: {
            'X-CSRFToken': getCookie('csrftoken')
        },
        data: {
            idClient: idClient,
            newAdrClient: newAdrClient,
            newAdr2Client: newAdr2Client,
            newAdrVilleClient: newAdrVilleClient
        },
        success: function (data) {
            alert('Mise à jour côté serveur effectuée avec succès !');
        },
        error: function (error) {
            console.error('Erreur lors de la mise à jour :', error);
        }
    });
}

function reloadCreateFormBill() {
    setTimeout(function() {
        window.location.reload();
    }, 1000);
}    

//Crée un overlay pour les popups d'ajout/maj
function addOverlayFormsCF() {
    var overlay = document.createElement('div');
    overlay.className="overlay-popup";
    overlay.style.position = 'fixed';
    overlay.style.top = '0';
    overlay.style.left = '0';
    overlay.style.width = '100%';
    overlay.style.height = '100%';
    overlay.style.backgroundColor = 'rgba(0, 0, 0, 0.6)';
    overlay.style.zIndex = '9998'; 
    document.body.appendChild(overlay);
}



function openModalAddFourn(event) {
    event.preventDefault();     
    var link = event.target.closest('a'); 
    var url = link.href;    
    if (!url) {
        console.error('L\'URL de la requête est indéfinie.');
        return;
    }
    addOverlayFormsCF();
    var overlay = document.querySelector('.overlay-popup');
    overlay.addEventListener('click', function(event) {
        popup.focus();
    });
    var screenWidth = window.screen.width;
    var screenHeight = window.screen.height;   
    var popupWidth = 600;
    var popupHeight = 688; 
    var popupLeft = (screenWidth - popupWidth) / 2;
    var popupTop = (screenHeight - popupHeight) / 2;   
    var popup = window.open('', 'popup', `width=${popupWidth},height=${popupHeight},left=${popupLeft},top=${popupTop}`);
  
    fetch(url)
        .then(response => response.text())
        .then(html => {
            var parser = new DOMParser();
            var doc = parser.parseFromString(html, 'text/html');           
            var form = doc.querySelector('.form_create_bill');
            var paragraphs = form.querySelectorAll('p');        
            popup.document.write('<html><head><meta charset="UTF-8"><meta name="viewport" content="width=device-width, initial-scale=1.0"><link rel="shortcut icon" type="image/x-icon" href="../../static/img/favicon.png"><link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"><link rel="stylesheet" href="../../static/css/style.css"></head><body><div class="container mt-3"><div class="row"><div class="col-md-9 offset-md-2"><h2>Ajouter un fournisseur</h2><div class="form-import-control mb-3"><form method="post" class="form_create_bill"><input type="hidden" name="csrfmiddlewaretoken" value="' + getCookie('csrftoken') + '">');
            paragraphs.forEach(paragraph => {
                popup.document.write(paragraph.outerHTML);
            });
            popup.document.write('<button onclick="submitModalAddFourn(event);" href="nouveau-fournisseur"  class="btn btn-primary">Ajouter</button></form></div></div></div></div><script src="../../static/js/script.js" async></script><script src="https://cdn.jsdelivr.net/npm/chart.js" async></script><script src="https://code.jquery.com/jquery-3.6.0.min.js" async></script><script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" async></script><script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" async></script></body>');
            popup.addEventListener('beforeunload', function() {
                popup.document.body.innerHTML = ''; 
                document.body.removeChild(overlay);
                updateFournisseurSelect(-1);
            });         
        })
        .catch(error => console.error('Une erreur est survenue lors du chargement du formulaire :', error));
}

function submitModalAddFourn(event) {
    event.preventDefault(); 
    var form = document.querySelector('.form_create_bill');
    var formData = new FormData(form);
    fetch('/facture/create/nouveau-fournisseur/', {
        method: 'POST',
        body: formData,
        headers: {
            'X-CSRFToken': getCookie('csrftoken')
        }
    })
    .then(response => {
        if (response.ok) {
            window.close();
        } else {
            console.error('Erreur lors de l\'ajout du fournisseur');
        }
    })
    .catch(error => {
        console.error('Une erreur est survenue lors de la soumission du formulaire :', error);
    });
}

function openModalAddCli(event) {
    event.preventDefault(); 
    
    var link = event.target.closest('a'); 
    var url = link.href;     
    if (!url) {
        console.error('L\'URL de la requête est indéfinie.');
        return;
    }
    addOverlayFormsCF();
    var overlay = document.querySelector('.overlay-popup');
    overlay.addEventListener('click', function(event) {
        popup.focus();
    });
    var screenWidth = window.screen.width;
    var screenHeight = window.screen.height;   
    var popupWidth = 600;
    var popupHeight = 688; 
    var popupLeft = (screenWidth - popupWidth) / 2;
    var popupTop = (screenHeight - popupHeight) / 2;   
    var popup = window.open('', 'popup', `width=${popupWidth},height=${popupHeight},left=${popupLeft},top=${popupTop}`);
  
    fetch(url)
        .then(response => response.text())
        .then(html => {
            var parser = new DOMParser();
            var doc = parser.parseFromString(html, 'text/html');            
            var form = doc.querySelector('.form_create_bill');
            var paragraphs = form.querySelectorAll('p');
                     
            popup.document.write('<html><head><meta charset="UTF-8"><meta name="viewport" content="width=device-width, initial-scale=1.0"><link rel="shortcut icon" type="image/x-icon" href="../../static/img/favicon.png"><link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"><link rel="stylesheet" href="../../static/css/style.css"></head><body><div class="container mt-3"><div class="row"><div class="col-md-9 offset-md-2"><h2>Ajouter un client</h2><div class="form-import-control mb-3"><form method="post" class="form_create_bill"><input type="hidden" name="csrfmiddlewaretoken" value="' + getCookie('csrftoken') + '">');

            paragraphs.forEach(paragraph => {
                popup.document.write(paragraph.outerHTML);
            });
            popup.document.write('<button onclick="submitModalAddCli(event);" href="nouveau-client"  class="btn btn-primary">Ajouter</button></form></div></div></div></div><script src="../../static/js/script.js" async></script><script src="https://cdn.jsdelivr.net/npm/chart.js" async></script><script src="https://code.jquery.com/jquery-3.6.0.min.js" async></script><script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" async></script><script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" async></script></body>');
            popup.addEventListener('beforeunload', function() {
                popup.document.body.innerHTML = ''; 
                document.body.removeChild(overlay);
                updateClientSelect(-1);
            });
          
        })
        .catch(error => console.error('Une erreur est survenue lors du chargement du formulaire :', error));
}

function submitModalAddCli(event) {
    event.preventDefault(); 
    var form = document.querySelector('.form_create_bill');
    var formData = new FormData(form);

    fetch('/facture/create/nouveau-client/', {
        method: 'POST',
        body: formData,
        headers: {
            'X-CSRFToken': getCookie('csrftoken')
        }
    })
    .then(response => {
        if (response.ok) {
            window.close();
        } else {
        }
    })
    .catch(error => {
        console.error('Une erreur est survenue lors de la soumission du formulaire :', error);
    });
}

function updateFournisseurSelect(fournisseurId) { 
    fetch('/facture/create/fournisseurs/')
        .then(response => response.json())
        .then(data => {          
            const selectElement = document.getElementById('id_fournisseur');
            selectElement.innerHTML = ''; 
            data.forEach(fournisseur => {
                const option = document.createElement('option');
                option.value = fournisseur.id_fourn;
                option.textContent = fournisseur.r_social_fourn;
                selectElement.appendChild(option)
            });
            checkSelectedFournisseur(fournisseurId);
        })
        .catch(error => console.error('Une erreur est survenue lors de la récupération des fournisseurs :', error));
}

function checkSelectedFournisseur(fournisseurId) {
    var selectElement = document.getElementById('id_fournisseur');
    var selectedOption = selectElement.options[selectElement.selectedIndex];
    var openModalLink = document.getElementById('openModalUpdFourn');
    if (selectedOption.value !== '') {
        openModalLink.style.visibility = 'visible';
        if(fournisseurId > 0) {
            selectElement.value = fournisseurId;
        }
        else if (fournisseurId === -1) {
            var maxValue = -Infinity;
            var maxOptionIndex = -1;
        
            for (var i = 0; i < selectElement.options.length; i++) {
                var optionValue = parseInt(selectElement.options[i].value);
                if (!isNaN(optionValue) && optionValue > maxValue) {
                    maxValue = optionValue;
                    maxOptionIndex = i;
                }
            }      
            if (maxOptionIndex !== -1) {
                selectElement.selectedIndex = maxOptionIndex;
            } else {
                console.error('Aucune option avec une valeur numérique trouvée.');
            }
        }
    } else {
        openModalLink.style.visibility = 'hidden';
    }
}

function updateClientSelect(clientId) {
    fetch('/facture/create/clients/')
        .then(response => response.json())
        .then(data => {
            const selectElement = document.getElementById('id_client');
            selectElement.innerHTML = '';  
            data.forEach(client => {
                const option = document.createElement('option');
                option.value = client.id_client;
                option.textContent = client.nom_client + ' ' + client.prenom_client;
                selectElement.appendChild(option);
            });
            checkSelectedClient(clientId);
        })
        .catch(error => console.error('Une erreur est survenue lors de la récupération des clients :', error));
}

function checkSelectedClient(clientId) {
    var selectElement = document.getElementById('id_client');
    var selectedOption = selectElement.options[selectElement.selectedIndex];
    var openModalLink = document.getElementById('openModalUpdCli');
    if (selectedOption.value !== '') {
        openModalLink.style.visibility = 'visible';
        if(clientId > 0) {
            selectElement.value = clientId;
        }
        else if(clientId == -1){
            var maxValue = -Infinity;
            var maxOptionIndex = -1;       
            for (var i = 0; i < selectElement.options.length; i++) {
                var optionValue = parseInt(selectElement.options[i].value);
                if (!isNaN(optionValue) && optionValue > maxValue) {
                    maxValue = optionValue;
                    maxOptionIndex = i;
                }
            }      
            if (maxOptionIndex !== -1) {
                selectElement.selectedIndex = maxOptionIndex;
            } else {
                console.error('Aucune option avec une valeur numérique trouvée.');
            }
        }
    } else {
        openModalLink.style.visibility = 'hidden';
    }
}

function openModalUpdFourn(event) {
    event.preventDefault(); 
    addOverlayFormsCF();
    var overlay = document.querySelector('.overlay-popup');
    overlay.addEventListener('click', function(event) {
        popup.focus();
    });
    var screenWidth = window.screen.width;
    var screenHeight = window.screen.height;   
    var popupWidth = 600;
    var popupHeight = 686; 
    var popupLeft = (screenWidth - popupWidth) / 2;
    var popupTop = (screenHeight - popupHeight) / 2;
    var selectElement = document.getElementById('id_fournisseur');
    var valeurSelectionnee = selectElement.options[selectElement.selectedIndex];
    var fournisseurId = valeurSelectionnee.value;
    var url = '/facture/create/maj-fournisseur/' + fournisseurId + '/';
    var popup = window.open(url, 'popup', `width=${popupWidth},height=${popupHeight},left=${popupLeft},top=${popupTop}`);

    fetch(url)
        .then(response => response.text())
        .then(html => {
            var parser = new DOMParser();
            var doc = parser.parseFromString(html, 'text/html');            
            var form = doc.querySelector('.form_create_bill');
            var paragraphs = form.querySelectorAll('p');                    
            popup.document.write('<html><head><meta charset="UTF-8"><meta name="viewport" content="width=device-width, initial-scale=1.0"><link rel="shortcut icon" type="image/x-icon" href="../../static/img/favicon.png"><link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"><link rel="stylesheet" href="../../static/css/style.css"></head><body><div class="container mt-3"><div class="row"><div class="col-md-9 offset-md-2"><h2>Modifier un fournisseur</h2><div class="form-import-control mb-3"><form method="post" class="form_create_bill"><input type="hidden" name="csrfmiddlewaretoken" value="' + getCookie('csrftoken') + '"><input type="hidden" name="id_fourn" value="'+ fournisseurId +'">');
            paragraphs.forEach(paragraph => {
                popup.document.write(paragraph.outerHTML);
            });
            popup.document.write('<button onclick="submitModalUpdFourn(event);" href="maj-fournisseur"  class="btn btn-primary">Mettre à jour</button></form></div></div></div></div><script src="../../static/js/script.js" async></script><script src="https://cdn.jsdelivr.net/npm/chart.js" async></script><script src="https://code.jquery.com/jquery-3.6.0.min.js" async></script><script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" async></script><script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" async></script></body>');
            popup.addEventListener('beforeunload', function() {
                popup.document.body.innerHTML = ''; 
                document.body.removeChild(overlay);
                updateFournisseurSelect(fournisseurId);
            });         
        })
        .catch(error => console.error('Une erreur est survenue lors du chargement du formulaire :', error));
}

function openModalUpdCli(event) {
    event.preventDefault(); 
    addOverlayFormsCF();
    var overlay = document.querySelector('.overlay-popup');
    overlay.addEventListener('click', function(event) {
        popup.focus();
    });
    var screenWidth = window.screen.width;
    var screenHeight = window.screen.height;
    var popupWidth = 600;
    var popupHeight = 686; 
    var popupLeft = (screenWidth - popupWidth) / 2;
    var popupTop = (screenHeight - popupHeight) / 2;
    var selectElement = document.getElementById('id_client');
    var valeurSelectionnee = selectElement.options[selectElement.selectedIndex];
    var clientId = valeurSelectionnee.value;
    var url = '/facture/create/maj-client/' + clientId + '/';
    var popup = window.open(url, 'popup', `width=${popupWidth},height=${popupHeight},left=${popupLeft},top=${popupTop}`);

    fetch(url)
        .then(response => response.text())
        .then(html => {
            var parser = new DOMParser();
            var doc = parser.parseFromString(html, 'text/html');           
            var form = doc.querySelector('.form_create_bill');
            var paragraphs = form.querySelectorAll('p');                   
            popup.document.write('<html><head><meta charset="UTF-8"><meta name="viewport" content="width=device-width, initial-scale=1.0"><link rel="shortcut icon" type="image/x-icon" href="../../static/img/favicon.png"><link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"><link rel="stylesheet" href="../../static/css/style.css"></head><body><div class="container mt-3"><div class="row"><div class="col-md-9 offset-md-2"><h2>Modifier un client</h2><div class="form-import-control mb-3"><form method="post" class="form_create_bill"><input type="hidden" name="csrfmiddlewaretoken" value="' + getCookie('csrftoken') + '"><input type="hidden" name="id_cli" value="'+ clientId +'">');
            paragraphs.forEach(paragraph => {
                popup.document.write(paragraph.outerHTML);
            });
            popup.document.write('<button onclick="submitModalUpdCli(event);" href="maj-client"  class="btn btn-primary">Mettre à jour</button></form></div></div></div></div><script src="../../static/js/script.js" async></script><script src="https://cdn.jsdelivr.net/npm/chart.js" async></script><script src="https://code.jquery.com/jquery-3.6.0.min.js" async></script><script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" async></script><script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" async></script></body>');
            popup.addEventListener('beforeunload', function() {
                popup.document.body.innerHTML = ''; 
                document.body.removeChild(overlay);
                updateClientSelect(clientId);
            });         
        })
        .catch(error => console.error('Une erreur est survenue lors du chargement du formulaire :', error));
}

function submitModalUpdFourn(event) {
    event.preventDefault(); 
    var form = document.querySelector('.form_create_bill');
    var formData = new FormData(form);
    var inputElement = document.querySelector('input[name="id_fourn"]');
    if (inputElement) {
        var fournisseurId = inputElement.value;
    }
    var url = '/facture/create/maj-fournisseur/' + fournisseurId +'/';
    fetch(url, {
        method: 'POST',
        body: formData,
        headers: {
            'X-CSRFToken': getCookie('csrftoken')
        }
    })
    .then(response => {
        if (response.ok) {
            window.close();
        } else {
            console.error('Erreur lors de l\'ajout du fournisseur');
        }
    })
    .catch(error => {
        console.error('Une erreur est survenue lors de la soumission du formulaire :', error);
    });
}

function submitModalUpdCli(event) {
    event.preventDefault(); 
    var form = document.querySelector('.form_create_bill');
    var formData = new FormData(form);
    var inputElement = document.querySelector('input[name="id_cli"]');
    if (inputElement) {
        var clientId = inputElement.value;
    }
    var url = '/facture/create/maj-client/' + clientId +'/';
    fetch(url, {
        method: 'POST',
        body: formData,
        headers: {
            'X-CSRFToken': getCookie('csrftoken')
        }
    })
    .then(response => {
        if (response.ok) {
            window.close();
        } else {
            console.error('Erreur lors de l\'ajout du client');
        }
    })
    .catch(error => {
        console.error('Une erreur est survenue lors de la soumission du formulaire :', error);
    });
}
