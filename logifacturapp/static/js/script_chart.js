document.addEventListener('DOMContentLoaded', function() {
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
    dataNumClients = [];

    const selectedCategory = categorySelect.value;
    if (categoryChart) {
        categoryChart.destroy();
    }
    for (const month in cat) {
        labelsCat.push(month);

        if (selectedCategory) {
            const selectedCategoryEntries = cat[month].filter(entry => entry.nom_cat_facture === selectedCategory);

            if (selectedCategoryEntries.length > 0) {
                const total = selectedCategoryEntries.reduce((acc, entry) => acc + parseFloat(entry.total_ttc), 0);
                dataCat.push(total);
                dataNumClients.push(selectedCategoryEntries[0].num_clients);
            } else {
                dataCat.push(0);
                dataNumClients.push(0);
            }
        } else {
            const totalAllCategories = cat[month].reduce((acc, entry) => acc + parseFloat(entry.total_ttc), 0);
            dataCat.push(totalAllCategories);
            const totalClientsAllCategories = cat[month].reduce((acc, entry) => acc + entry.num_clients, 0);
            dataNumClients.push(totalClientsAllCategories);
        }
    }
        
    const ctxCat = document.getElementById('chartCat').getContext('2d');
    categoryChart = new Chart(ctxCat, {
        type: 'bar',
        data: {
            labels: labelsCat,
            datasets: [
                {
                    label: 'Total TTC',
                    data: dataCat,
                    backgroundColor: 'rgba(65, 77, 109, 0.8)',
                    borderColor: 'rgb(65, 77, 109);',
                    borderWidth: 1
                },
                {
                    label: 'Nombre de clients',
                    data: dataNumClients,
                    type: 'bar',
                    yAxisID: 'numClients', 
                    borderColor: 'darkorange',
                    backgroundColor: 'rgb(255,208,184)',
                    borderWidth: 1,
                }
            ]
        },
        options: {
            hover: {
                mode: 'nearest',
                intersect: true,
                animationDuration: 0,
            },
            scales: {
                y: {
                    beginAtZero: true
                },
                numClients: { 
                    position: 'right',
                    beginAtZero: true,
                    ticks: {
                        stepSize: 2
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
    dataPanier = [];

    const selectedFourn = fournSelect.value;
    if (fournChart) {
         fournChart.destroy();
    }
    for (const month in fourn) {
        labelsFourn.push(month);

        
        if(selectedFourn) {
            const selectedFournEntries = fourn[month].filter(entry => entry.r_social_fourn === selectedFourn);
            console.log(selectedFournEntries);
            if (selectedFournEntries.length > 0) {
                const total = selectedFournEntries.reduce((acc, entry) => acc + parseFloat(entry.total_ttc), 0);
                dataFourn.push(total);
                dataPanier.push(selectedFournEntries[0].panier_moyen);
            } else {
                dataFourn.push(0); 
                dataPanier.push(0);
            }
        } else {
            const totalAllFournisseurs = fourn[month].reduce((acc, entry) => acc + parseFloat(entry.total_ttc), 0);
            dataFourn.push(totalAllFournisseurs);

            const totalPanierMoyen = fourn[month].reduce((acc, entry) => acc + (entry.panier_moyen * entry.total_ttc), 0);
            const panierMoyenAllFournisseurs = totalPanierMoyen / totalAllFournisseurs;
            dataPanier.push(panierMoyenAllFournisseurs || 0);
        }       
    }
    const ctxFourn = document.getElementById('chartFourn').getContext('2d');
    fournChart = new Chart(ctxFourn, {
        type: 'bar',
        data: {
            labels: labelsFourn,
            datasets: [{
                label: 'Total TTC',
                data: dataFourn,
                backgroundColor: 'rgba(65, 77, 109, 0.8)',
                borderColor: 'rgb(65, 77, 109);',
                borderWidth: 1
            },
            {
                label: 'Panier moyen',
                data: dataPanier,
                type: 'bar',
                borderColor: 'darkorange',
                backgroundColor: 'rgb(255,208,184)',
                borderWidth: 1,
               
            }]
        },
        options: {
            hover: {
                mode: 'nearest',
                intersect: true,
                animationDuration: 0,
            },
            scales: {
                y: {
                    beginAtZero: true
                },
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
    dataPanier = [];

    const selectedCli = cliSelect.value;
    if (cliChart) {
         cliChart.destroy();
    }
    for (const month in cli) {
        labelsCli.push(month);
             
        if (selectedCli) {
            const selectedCliEntries = cli[month].filter(entry => {
                const clientName = `${entry.nom_client} ${entry.prenom_client}`;
                return clientName === selectedCli;
            });

            if (selectedCliEntries.length > 0) {
                const total = selectedCliEntries.reduce((acc, entry) => acc + parseFloat(entry.total_ttc), 0);
                dataCli.push(total);
                dataPanier.push(selectedCliEntries[0].panier_moyen);
           } else {
                dataCli.push(0); 
                dataPanier.push(0);
           } 
        } else {
            const totalAllClients = cli[month].reduce((acc, entry) => acc + parseFloat(entry.total_ttc), 0);
            dataCli.push(totalAllClients);

            const totalPanierMoyen = cli[month].reduce((acc, entry) => acc + (entry.panier_moyen * entry.total_ttc), 0);
            const panierMoyenAllClients = totalPanierMoyen / totalAllClients;
            dataPanier.push(panierMoyenAllClients || 0);
        }
    }
    const ctxCli = document.getElementById('chartClient').getContext('2d');
    cliChart = new Chart(ctxCli, {
        type: 'bar',
        data: {
            labels: labelsCli,
            datasets: [{
                    label: 'Total TTC',
                    data: dataCli,
                    backgroundColor: 'rgba(65, 77, 109, 0.8)',
                    borderColor: 'rgb(65, 77, 109);',
                    borderWidth: 1
                },
                {
                    label: 'Panier moyen',
                    data: dataPanier,
                    type: 'bar',
                    borderColor: 'darkorange',
                    backgroundColor: 'rgb(255,208,184)',
                    borderWidth: 1,
                }]
            },
            options: {
                hover: {
                    mode: 'nearest',
                    intersect: true,
                    animationDuration: 0,
                },
            }         
        });
    }; 
});