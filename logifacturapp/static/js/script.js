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
        $('.days-list').on('click', 'a', function(e){
            e.preventDefault();          
            var selectedDay = $(this).data('value');
            var selectedMonth = $('.months-list a.selected').data('value');
            var caseSel = $(this);
            $('.days-list a').removeClass('selected');

            $.ajax({
                url: 'jour/' + selectedMonth + '/' + selectedDay + '/',
                method: 'GET',
                success: function(data) {
                    var $data = $(data);
                    var dayEventContent = $data.find('.noteList').html();
                    caseSel.addClass('selected');
                    var $noteList = $('.noteList');
                    $noteList.empty();
                    $noteList.append(dayEventContent);
                    
                    var dateClic = caseSel.attr('href');
                    var dateDash = dateClic.substring(dateClic.indexOf('JOUR/') + 6);                  
                    var dateParts = dateDash.split('/');
                    var monthNumber = parseInt(dateParts[0], 10);
                    var dayNumber = parseInt(dateParts[1], 10);

                    var dateObj = new Date(new Date().getFullYear(), monthNumber - 1, dayNumber);
                    var dayNames = ['Dimanche','Lundi', 'Mardi', 'Mercredi', 'Jeudi', 'Vendredi', 'Samedi'];
                    var monthNames = ['Janvier', 'Fevrier', 'Mars', 'Avril', 'Mai', 'Juin', 'Juillet', 'Août', 'Septembre', 'Octobre', 'Novembre', 'Decembre'];

                    var dayName = dayNames[dateObj.getDay()];
                    var formattedDate = dayName + ' ' + dateObj.getDate() + ' ' + monthNames[dateObj.getMonth()];
                    $('.date').text(formattedDate);
                },
                error: function(error) {
                    console.log(error);
                }
            });
        });        
    });

    //GRAPHIQUES
    const categoriesTotals = document.getElementById('categories').getAttribute('data-categories-totals');
    const fournisseursTotals = document.getElementById('fournisseurs').getAttribute('data-fournisseurs-totals');
    const clientsTotals = document.getElementById('clients').getAttribute('data-clients-totals');
    let cat = JSON.parse(categoriesTotals.replace(/'/g, '"').replace(/Decimal\(/g, '').replace(/\)/g, ''));
    let fourn = JSON.parse(fournisseursTotals.replace(/'/g, '"').replace(/Decimal\(/g, '').replace(/\)/g, ''));
    let cli = JSON.parse(clientsTotals.replace(/'/g, '"').replace(/Decimal\(/g, '').replace(/\)/g, ''));
    let categoryChart;
    let fournChart;
    let cliChart;
    const categorySelect = document.getElementById('categorySelect');
    const fournSelect = document.getElementById('fournSelect');
    const cliSelect = document.getElementById('clientSelect');

    // Catégories 
    const uniqueCategories = new Set();
    for (const month in cat) {
        for (const entry of cat[month]) {
            uniqueCategories.add(entry.nom_cat_facture);
        }
    }
    for (const category of uniqueCategories) {
        const option = document.createElement('option');
        option.value = category;
        option.text = category;
        categorySelect.add(option);
    }

    updateCatChart();
    categorySelect.addEventListener('change', updateCatChart);
    function updateCatChart() {
        labelsCat = [];
        dataCat = [];
        dataNumFactures = [];

        const selectedCategory = categorySelect.value;
        if (categoryChart) {
            categoryChart.destroy();
        }
        for (const month in cat) {
            labelsCat.push(month);
            const selectedCategoryEntries = cat[month].filter(entry => entry.nom_cat_facture === selectedCategory);

            if (selectedCategoryEntries.length > 0) {
                const total = selectedCategoryEntries.reduce((acc, entry) => acc + parseFloat(entry.total_ttc), 0);
                dataCat.push(total);
                dataNumFactures.push(selectedCategoryEntries[0].num_factures);
   
            } else {
                dataCat.push(0); 
                dataNumFactures.push(0);
            }        
        }
        
        const ctxCat = document.getElementById('chartCat').getContext('2d');
        categoryChart = new Chart(ctxCat, {
            type: 'bar',
            data: {
                labels: labelsCat,
                datasets: [
                    {
                        label: 'Total TTC par mois',
                        data: dataCat,
                        backgroundColor: 'rgba(86, 110, 169, 0.6)',
                        borderColor: 'rgba(86, 110, 169, 0.6)',
                        borderWidth: 1
                    },
                    {
                        label: 'Nombre de factures',
                        data: dataNumFactures,
                        type: 'bar',
                        yAxisID: 'numFactures', 
                        borderColor: 'rgb(255,208,184)',
                        backgroundColor: 'rgb(255,208,184)',
                        borderWidth: 1,
                        fill: false
                    }
                ]
            },
            options: {
                scales: {
                    y: {
                        beginAtZero: true
                    },
                    numFactures: { 
                        position: 'right',
                        beginAtZero: true,
                        ticks: {
                            stepSize: 1
                        }
                    }
                }
            }
        });
    };

    // Fournisseurs
    const uniqueFournisseurs = new Set();
    for (const month in fourn) {
        for (const entry of fourn[month]) {
            uniqueFournisseurs.add(entry.r_social_fourn);
        }
    }

    for (const fournisseur of uniqueFournisseurs) {
        const option = document.createElement('option');
        option.value = fournisseur;
        option.text = fournisseur;
        fournSelect.add(option);
    }

    updateFournisseurChart();
    fournSelect.addEventListener('change', updateFournisseurChart);
    function updateFournisseurChart() {
        labelsFourn = [];
        dataFourn = [];
        dataNumFactures = [];

        const selectedFourn = fournSelect.value;
        if (fournChart) {
            fournChart.destroy();
        }
        for (const month in fourn) {
            labelsFourn.push(month);
            const selectedFournEntries = fourn[month].filter(entry => entry.r_social_fourn === selectedFourn);
    
            if (selectedFournEntries.length > 0) {
                const total = selectedFournEntries.reduce((acc, entry) => acc + parseFloat(entry.total_ttc), 0);
                dataFourn.push(total);
                dataNumFactures.push(selectedFournEntries[0].num_factures);
                console.log(selectedFournEntries);
            } else {
                dataFourn.push(0); 
                dataNumFactures.push(0);
            }
        }
        const ctxFourn = document.getElementById('chartFourn').getContext('2d');
        fournChart = new Chart(ctxFourn, {
            type: 'bar',
            data: {
                labels: labelsFourn,
                datasets: [{
                    label: 'Total TTC par mois',
                    data: dataFourn,
                    backgroundColor: 'rgba(86, 110, 169, 0.6)',
                    borderColor: 'rgba(86, 110, 169, 0.6)',
                    borderWidth: 1
                },
                {
                    label: 'Nombre de factures',
                    data: dataNumFactures,
                    type: 'bar',
                    yAxisID: 'numFactures', 
                    borderColor: 'rgb(255,208,184)',
                    backgroundColor: 'rgb(255,208,184)',
                    borderWidth: 1,
                    fill: false
                }]
            },
            options: {
                scales: {
                    y: {
                        beginAtZero: true
                    },
                    numFactures: { 
                        position: 'right',
                        beginAtZero: true,
                        ticks: {
                            stepSize: 1
                        }
                    }
                }
            }
        });
    };
    
     // Clients 
    const uniqueClient = new Set();
    for (const month in cli) {
        for (const entry of cli[month]) {
            const clientName = `${entry.nom_client} ${entry.prenom_client}`;
            uniqueClient.add(clientName);
        }
    }

    for (const client of uniqueClient) {
        const option = document.createElement('option');
        option.value = client;
        option.text = client;
        cliSelect.add(option);
    }

    updateClientChart();
    cliSelect.addEventListener('change', updateClientChart);
    function updateClientChart() {
        labelsCli = [];
        dataCli = [];
        dataNumFactures = [];

        const selectedCli = cliSelect.value;
        if (cliChart) {
            cliChart.destroy();
        }
        for (const month in cli) {
            labelsCli.push(month);
            const selectedCliEntries = cli[month].filter(entry => {
                const clientName = `${entry.nom_client} ${entry.prenom_client}`;
                return clientName === selectedCli;
            });
    
            if (selectedCliEntries.length > 0) {
                const total = selectedCliEntries.reduce((acc, entry) => acc + parseFloat(entry.total_ttc), 0);
                dataCli.push(total);
                dataNumFactures.push(selectedCliEntries[0].num_factures);
            } else {
                dataCli.push(0); 
                dataNumFactures.push(0);
            }           
        }
        const ctxCli = document.getElementById('chartClient').getContext('2d');
        cliChart = new Chart(ctxCli, {
            type: 'bar',
            data: {
                labels: labelsCli,
                datasets: [{
                    label: 'Total TTC par mois',
                    data: dataCli,
                    backgroundColor: 'rgba(86, 110, 169, 0.6)',
                    borderColor: 'rgba(86, 110, 169, 0.6)',
                    borderWidth: 1
                },
                {
                    label: 'Nombre de factures',
                    data: dataNumFactures,
                    type: 'bar',
                    yAxisID: 'numFactures', 
                    borderColor: 'rgb(255,208,184)',
                    backgroundColor: 'rgb(255,208,184)',
                    borderWidth: 1,
                    fill: false
                }]
            },
            options: {
                scales: {
                    y: {
                        beginAtZero: true
                    },
                    numFactures: { 
                        position: 'right',
                        beginAtZero: true,
                        ticks: {
                            stepSize: 1
                        }
                    }
                }
            }
        });
    }; 
});
