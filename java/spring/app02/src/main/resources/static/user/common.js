

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


    /*****************************************
    // form 바인딩. id와 json key 값이 동일해야 한다.
    ******************************************/
    let elements = document.querySelectorAll('#exampleForm input[id],select[id],textarea[id]');

    for(let elem of elements){
        if(elem.type == 'checkbox') {
            entId(elem.id).checked = result[elem.id];
        } else {
            entId(elem.id).value = result[elem.id];
        }
    }

    callback(result);
}