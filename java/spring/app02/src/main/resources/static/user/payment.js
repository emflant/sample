
var s1;
var fp;

document.addEventListener('DOMContentLoaded', function() {
    var myModalEl = entId('exampleModal');
    myModalEl.addEventListener('hidden.bs.modal', function (event) {
        entId("exampleForm").reset();
    });

    s1 = document.querySelectorAll('#exampleForm input[id],select[id],textarea[id]');

  const myChart = new Chart(
    document.getElementById('myChart'),
    config
  );

});

function btnRegister_onclick(){

    entId('paymentDate').value = new Date().toISOString().slice(0,10);
    entId('paymentType').value = '1';
    entId('classesPerWeek').value = '1';
    entId('minutesPerSession').value = '50';
    entId('amount').value = 80000;

    fp.setDate(entId('paymentDate').value);

    init_component();
}

function classesPerWeek_onchange(){
    calculate_amount();
}

function minutesPerSession_onchange(){
    calculate_amount();
}

function calculate_amount(){

    if(entId('amountModifyYn').checked){
        return;
    }

    var vClassesPerWeek = entId('classesPerWeek').value;
    var vMinutesPerSession = entId('minutesPerSession').value;

//    alert(vClassesPerWeek + ',' + vMinutesPerSession);

    if(vClassesPerWeek == '1' && vMinutesPerSession == '50'){
        entId('amount').value = 80000;
    } else if(vClassesPerWeek == '1' && vMinutesPerSession == '80'){
        entId('amount').value = 120000;
    } else if(vClassesPerWeek == '2' && vMinutesPerSession == '50'){
        entId('amount').value = 160000;
    } else if(vClassesPerWeek == '2' && vMinutesPerSession == '80'){
        entId('amount').value = 240000;
    }
}

function paymentType_onchange(){
    if(entId('paymentType').value != '1'){
        entId('cashReceiptYn').checked = false;
    }
    init_component();
}

function amountModifyYn_onchange(){
    if(entId('amountModifyYn').checked){
        entId('amount').value = 0;
    } else {
        calculate_amount();
    }
    init_component();
}

function paymentDate_onclick(paymentId){
    paymentOne.id = paymentId;
    entCall('/paymentRest', paymentOne, postProcess);
}

function postProcess(result){
    init_component();
    fp.parseDate()
//    alert(result.paymentDate);
//    fp.setDate(new Date(2022,1,18));
//    fp.setDate(result.paymentDate, 'YYYY-mm-dd');
    fp.setDate(result.paymentDate);
    var myModalEl = entId('exampleModal');
    var myModal = new bootstrap.Modal(myModalEl);
    myModal.show();
}

function init_component(){

    if(entId('amountModifyYn').checked){
        entId('amount').readOnly = false;
    } else {
        entId('amount').readOnly = true;
    }

    if(entId('paymentType').value == '1'){
        entId('cashReceiptYn').disabled = false;
    } else {
        entId('cashReceiptYn').disabled = true;
    }
}

function delYn_onchange() {
    if(entId('delYn').checked){
        entId('save-button').classList.add('btn-danger');
        entId('save-button').classList.remove('btn-primary');
        entId('save-button').innerText = "삭제";
    } else {
        entId('save-button').classList.add('btn-primary');
        entId('save-button').classList.remove('btn-danger');
        entId('save-button').innerText = "저장";
    }
}

//let labels = ['2021-10', '2021-11'];
//let amounts = [0,0];
//let members = [0,0];

let labels = [];
let amounts = [];
let members = [];

for(let pm of paymentMonths){
    labels.push(pm.paymentMonth);
    amounts.push(pm.sumAmount);
    members.push(pm.cntMember);
}

const data = {
    labels: labels,
    datasets: [
        {
            label: '수강료',
            data: amounts,
            borderColor: '#36a2eb',
            backgroundColor: '#36a2eb',
            yAxisID: 'y'
//            tension: 0.3
        },
        {
            label: '학생수',
            data: members,
            borderColor: '#ffb0c1',
            backgroundColor: '#ffb0c1',
            yAxisID: 'y1',
            type: 'bar'
        }
    ]
};

const config = {
    type: 'line',
    data: data,
    options: {
        interaction: {
            intersect: false,
            mode: 'index',
        },

        scales: {
            y: {
                type: 'linear',
                display: true,
                position: 'left',
                suggestedMin: 0,
                suggestedMax: 1000000,
            },
            y1: {
                type: 'linear',
                display: true,
                position: 'right',
                suggestedMin: 0,
                suggestedMax: 20,
                // grid line settings
                grid: {
                    // only want the grid lines for one axis to show up
                    drawOnChartArea: false,
                }
            }
        }
    }
};




document.addEventListener('DOMContentLoaded', function() {
    fp = flatpickr(entId("paymentDate"), {
        "locale": "ko"  // locale for this instance only
//        defaultDate : new Date(2022,1,10)
    });
});