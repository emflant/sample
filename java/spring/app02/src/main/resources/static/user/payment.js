
document.addEventListener('DOMContentLoaded', function() {
    var myModalEl = document.getElementById('exampleModal');
    myModalEl.addEventListener('hidden.bs.modal', function (event) {
        document.getElementById("exampleForm").reset();
    });
});

function btnRegister_onclick(){

    document.getElementById('paymentDate').value = new Date().toISOString().slice(0,10);
    document.getElementById('paymentType').value = '1';
    document.getElementById('classesPerWeek').value = '1';
    document.getElementById('minutesPerSession').value = '50';
    document.getElementById('amount').value = 80000;

    init_component();
}

function classesPerWeek_onchange(){
    calculate_amount();
}

function minutesPerSession_onchange(){
    calculate_amount();
}

function calculate_amount(){

    if(document.getElementById('amountModifyYn').checked){
        return;
    }

    var vClassesPerWeek = document.getElementById('classesPerWeek').value;
    var vMinutesPerSession = document.getElementById('minutesPerSession').value;

//    alert(vClassesPerWeek + ',' + vMinutesPerSession);

    if(vClassesPerWeek == '1' && vMinutesPerSession == '50'){
        document.getElementById('amount').value = 80000;
    } else if(vClassesPerWeek == '1' && vMinutesPerSession == '80'){
        document.getElementById('amount').value = 100000;
    } else if(vClassesPerWeek == '2' && vMinutesPerSession == '50'){
        document.getElementById('amount').value = 160000;
    } else if(vClassesPerWeek == '2' && vMinutesPerSession == '80'){
        document.getElementById('amount').value = 200000;
    }
}

function paymentType_onchange(){
    if(document.getElementById('paymentType').value == '1'){
        document.getElementById('cashReceiptYn').disabled = false;
    } else {
        document.getElementById('cashReceiptYn').disabled = true;
        document.getElementById('cashReceiptYn').checked = false;
    }
}

function amountModifyYn_onchange(){
    if(document.getElementById('amountModifyYn').checked){
        document.getElementById('amount').readOnly = false;
        document.getElementById('amount').value = 0;
    } else {
        document.getElementById('amount').readOnly = true;
        calculate_amount();
    }
}

async function paymentDate_onclick(paymentId){

    paymentOne.id = paymentId;

    let response = await fetch('/paymentRest', {
        method: 'POST',
        headers: {
            'Content-Type': 'application/json;charset=utf-8'
        },
        body: JSON.stringify(paymentOne)
    });

    let result = await response.json();

//    alert(JSON.stringify(result));

    var myModalEl = document.getElementById('exampleModal');
    var myModal = new bootstrap.Modal(myModalEl);

    document.getElementById('id').value = result.id;
    document.getElementById('paymentDate').value = result.paymentDate;
    document.getElementById('memberId').value = result.memberId;
    document.getElementById('paymentType').value = result.paymentType;
    document.getElementById('classesPerWeek').value = result.classesPerWeek;
    document.getElementById('minutesPerSession').value = result.minutesPerSession;
    document.getElementById('amountModifyYn').checked = result.amountModifyYn;
    document.getElementById('amount').value = result.amount;
    document.getElementById('cashReceiptYn').checked = result.cashReceiptYn;
    document.getElementById('message-text').value = result.message;
    document.getElementById('delYn').checked = result.delYn;

    init_component();
    myModal.show();
}

function init_component(){

    if(document.getElementById('amountModifyYn').checked){
        document.getElementById('amount').readOnly = false;
    } else {
        document.getElementById('amount').readOnly = true;
    }

    if(document.getElementById('paymentType').value == '1'){
        document.getElementById('cashReceiptYn').disabled = false;
    } else {
        document.getElementById('cashReceiptYn').disabled = true;
    }
}

function delYn_onchange() {
    if(document.getElementById('delYn').checked){
        document.getElementById('save-button').classList.add('btn-danger');
        document.getElementById('save-button').classList.remove('btn-primary');
        document.getElementById('save-button').innerText = "삭제";
    } else {
        document.getElementById('save-button').classList.add('btn-primary');
        document.getElementById('save-button').classList.remove('btn-danger');
        document.getElementById('save-button').innerText = "저장";
    }
}