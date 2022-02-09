

function entId(id){
    return document.getElementById(id);
}

async function entCall(serviceName, paramJson, callback){

    let response = await fetch(serviceName, {
        method: 'POST',
        headers: {
            'Content-Type': 'application/json;charset=utf-8'
        },
        body: JSON.stringify(paramJson)
    });

    let result = await response.json();

    entSetValues('exampleForm', result);

    callback(result);
}

/*****************************************
* form 바인딩. id와 json key 값이 동일해야 한다.
******************************************/
function entSetValues(formId, paramJson){

    let elements = document.querySelectorAll('#' + formId + ' input[id], #' + formId + ' select[id], #' + formId + ' textarea[id]');

//    alert(JSON.stringify(elements));

    for(let elem of elements){
        if(elem.type == 'checkbox') {
            entId(elem.id).checked = paramJson[elem.id];
        } else {
            entId(elem.id).value = paramJson[elem.id];
        }
    }
}