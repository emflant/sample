

function entId(id){
    return document.getElementById(id);
}

async function entCall(serviceName, paramJson){

    let response = await fetch(serviceName, {
        method: 'POST',
        headers: {
            'Content-Type': 'application/json;charset=utf-8'
        },
        body: JSON.stringify(paramJson)
    });

    return await response.json();
}