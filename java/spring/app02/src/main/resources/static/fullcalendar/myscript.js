

var myEvents = [{
          daysOfWeek:  [ '0', '1', '5', '6' ],
          display: 'background',
          backgroundColor: 'hsla(0,0%,84.3%,.7)'
      }];

for(var i = 0; i < domain.length; i++){
    var obj = new Object();

    if(domain[i].absentYn){
        obj.backgroundColor = '#fc9f67';
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

            delYn_onchange();
            memberId_onchange();
            absentYn_onchange();
            myModal.show();
        },
        eventClick: function(info) {
            //alert(JSON.stringify(info.event));
            var myModalEl = document.getElementById('exampleModal');
            var myModal = new bootstrap.Modal(myModalEl);

            document.getElementById('id').value = info.event.extendedProps.eventInfo.id;
            document.getElementById('classDate').value = info.event.extendedProps.eventInfo.classDate;
            document.getElementById('classTime').value = info.event.extendedProps.eventInfo.classTime;
            document.getElementById('memberId').value = info.event.extendedProps.eventInfo.memberId;
            document.getElementById('classCount').value = info.event.extendedProps.eventInfo.classCount;
            document.getElementById('absentYn').checked = info.event.extendedProps.eventInfo.absentYn;
            document.getElementById('message-text').value = info.event.extendedProps.eventInfo.message;
            document.getElementById('delYn').checked = info.event.extendedProps.eventInfo.delYn;

            delYn_onchange();
            memberId_onchange();
            absentYn_onchange();
            myModal.show();
        },
        events: myEvents
    });
    calendar.render();

});


