

var myEvents = [{
          daysOfWeek:  [ '0', '1', '5', '6' ],
          display: 'background',
          backgroundColor: 'hsla(0,0%,84.3%,.7)'
      }];

for(var i = 0; i < domain.length; i++){
    var obj = new Object();

    if(domain[i].absentYn){
        obj.backgroundColor = '#FF5E57';
    }

    if(domain[i].memberId == 'reservation'){
        obj.backgroundColor = '#82E359';
    }

    obj.title = domain[i].title;

    if(domain[i].classTime == ''){
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

function memberId_onchange(){
    var vMemberId = document.getElementById('memberId');
    var vClassCount = document.getElementById('classCount');
    var vAbsentYn = document.getElementById('absentYn');

    if(vMemberId.options[vMemberId.selectedIndex].value == 'reservation'){
        vClassCount.value = '';
        vClassCount.disabled = true;
        vAbsentYn.checked = false;
        vAbsentYn.disabled = true;
    } else {
        vClassCount.disabled = false;
        vAbsentYn.disabled = false;
    }
}


function absentYn_onchange(){
    var vClassCount = document.getElementById('classCount');
    var vAbsentYn = document.getElementById('absentYn');

    if(vAbsentYn.checked){
        vClassCount.value = '';
        vClassCount.disabled = true;
    } else {
        vClassCount.disabled = false;
    }
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

}

document.addEventListener('DOMContentLoaded', function() {
    var calendarEl = document.getElementById('calendar');
    var calendar = new FullCalendar.Calendar(calendarEl, {
        initialView: 'dayGridMonth',
        selectable: true,
        locale: 'ko',
        initialDate: vInitialDate,
        hiddenDays: [ 0,6 ],
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

            entSetValues('exampleModal', info.event.extendedProps.eventInfo);

            init_component();

            var myModalEl = document.getElementById('exampleModal');
            var myModal = new bootstrap.Modal(myModalEl);
            myModal.show();
        },
        events: myEvents
    });
    calendar.render();

});


