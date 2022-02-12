var myEvents = [{
          daysOfWeek:  [ '0', '1', '5', '6' ],
          display: 'background',
          backgroundColor: 'hsla(0,0%,84.3%,.7)'
      }];

var myCalendar;

for(var i = 0; i < domain.length; i++){
    var obj = new Object();

    if(domain[i].absentYn){

        // Sandstone 테마
        // 레드 '#b84743' '#c24148'
        // 오렌지 '#f47c3c'
        // 민트 '#2391be'
        // 그린 '#93c54b'
        // 남색 '#2b4f74'
        var vEventColor = '#f47c3c';
        obj.backgroundColor = vEventColor;
        obj.borderColor = vEventColor;
    }

//    if(domain[i].id == '61f8ebcbb9543170663e8056'){
//        var vEventColor = '#2391be';
//                obj.backgroundColor = vEventColor;
//                obj.borderColor = vEventColor;
//    }

    if(domain[i].memberId == 'reservation'){
        obj.backgroundColor = '#82E359';
    }

    obj.title = domain[i].title;

    if(domain[i].classTime == '' || domain[i].classTime == undefined){
        obj.start = new Date(domain[i].classDate);
        obj.allDay = true;
    } else {
        obj.start = new Date(domain[i].classDate + 'T' + domain[i].classTime + ':00');
    }

    obj.id = domain[i].id;
    obj.eventInfo = domain[i];
    myEvents.push(obj);
}

function delYn_onchange() {
    if(document.getElementById('delYn').checked){
        //class="btn btn-primary" id="save-button"
        document.getElementById('save-button').classList.add('btn-danger');
        document.getElementById('save-button').classList.remove('btn-primary');
        document.getElementById('save-button').innerText = "삭제";
    } else {
        document.getElementById('save-button').classList.add('btn-primary');
        document.getElementById('save-button').classList.remove('btn-danger');
        document.getElementById('save-button').innerText = "저장";
    }
}

async function memberId_onchange(){

    var vMemberId = document.getElementById('memberId');
    var vClassCount = document.getElementById('classCount');
    var vAbsentYn = document.getElementById('absentYn');

    if(vMemberId.options[vMemberId.selectedIndex].value == 'reservation'){
        vClassCount.value = '';
        vAbsentYn.checked = false;
    } else {

        // 학생을 선택하면 날짜에 맞추어 수강시간을 비동기로 가져온다.
        memberClassTime.id = document.getElementById('memberId').value;

        let response = await fetch('/getClassTime', {
            method: 'POST',
            headers: {
                'Content-Type': 'application/json;charset=utf-8'
            },
            body: JSON.stringify(memberClassTime)
        });

        let result = await response.json();
        //alert(JSON.stringify(result));


        var vClassdate = document.getElementById('classDate').value;
        var vDay = new Date(vClassdate).getDay();

        // 없을때만 읽어서 가져온다.
        if(vDay == '1'){
            document.getElementById('classTime').value = result.monClass;
        } else if(vDay == '2'){
            document.getElementById('classTime').value = result.tueClass;
        } else if(vDay == '3'){
            document.getElementById('classTime').value = result.wenClass;
        } else if(vDay == '4'){
            document.getElementById('classTime').value = result.thrClass;
        } else if(vDay == '5'){
            document.getElementById('classTime').value = result.friClass;
        } else if(vDay == '6'){
            document.getElementById('classTime').value = result.satClass;
        }

    }

    init_component();
}


function absentYn_onchange(){
    var vClassCount = document.getElementById('classCount');
    var vAbsentYn = document.getElementById('absentYn');

    vClassCount.value = '';

    if(vAbsentYn.checked){
        entId('classTime').value = '';
    }

    init_component();
}



function init_component(){

    var vMemberId = document.getElementById('memberId');
    // 결석 비활성화
    // 1. 상담예약일때,
    if(vMemberId.options[vMemberId.selectedIndex].value == 'reservation'){
        document.getElementById('absentYn').disabled = true;
    } else {
        document.getElementById('absentYn').disabled = false;
    }

    // 수업회차 비활성화
    // 1. 상담예약일때,
    // 2. 결석 일때,
    if(vMemberId.options[vMemberId.selectedIndex].value == 'reservation' ||
            document.getElementById('absentYn').checked){
        document.getElementById('classCount').disabled = true;
    } else {
        document.getElementById('classCount').disabled = false;
    }

    if(document.getElementById('absentYn').checked){
        entId('classTime').disabled = true;
    } else {
        entId('classTime').disabled = false;
    }
}

document.addEventListener('DOMContentLoaded', function() {
    var calendarEl = document.getElementById('calendar');
    var calendar = new FullCalendar.Calendar(calendarEl, {
        initialView: 'dayGridMonth',
        selectable: true,
        locale: 'ko',
        initialDate: vInitialDate,
        hiddenDays: [ 0,6 ],
        contentHeight: "auto",
        dateClick: function(info) {
            //alert('Clicked on: ' + info.dateStr);
            document.getElementById("exampleForm").reset();
            var myModalEl = document.getElementById('exampleModal');
            var myModal = new bootstrap.Modal(myModalEl);

            var classDate = document.getElementById('classDate');
            classDate.value = info.dateStr;

            init_component();
            myModal.show();
        },
        eventClick: function(info) {
//            alert(calendar.getDate());
            entSetValues('exampleModal', info.event.extendedProps.eventInfo);

            init_component();

            var myModalEl = document.getElementById('exampleModal');
            var myModal = new bootstrap.Modal(myModalEl);
            myModal.show();
        },
        events: myEvents
    });
    calendar.render();
    myCalendar = calendar;
    entId('searchMemberId').value = vSearchMemberId;
});


function memberId_onchange1(){

    var strDate;
    var strMonth = myCalendar.getDate().getMonth() + 1;

    if(strMonth >= 10){
        strDate = myCalendar.getDate().getFullYear() + '-' + strMonth + '-01'
    } else {
        strDate = myCalendar.getDate().getFullYear() + '-0' + strMonth + '-01'
    }

    window.location.href = '/class?date=' + strDate + '&searchMemberId='+entId("searchMemberId").value;
}