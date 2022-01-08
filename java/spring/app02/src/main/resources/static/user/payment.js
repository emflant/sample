
var s1;

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
    if(entId('paymentType').value == '1'){
        entId('cashReceiptYn').disabled = false;
    } else {
        entId('cashReceiptYn').disabled = true;
        entId('cashReceiptYn').checked = false;
    }
}

function amountModifyYn_onchange(){
    if(entId('amountModifyYn').checked){
        entId('amount').readOnly = false;
        entId('amount').value = 0;
    } else {
        entId('amount').readOnly = true;
        calculate_amount();
    }
}

function paymentDate_onclick(paymentId){
    paymentOne.id = paymentId;
    entCall('/paymentRest', paymentOne, postProcess);
}

function postProcess(result){



    init_component();
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