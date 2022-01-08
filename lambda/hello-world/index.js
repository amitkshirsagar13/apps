exports.handler = async (event) => {
    let greet = 'Hi';
    let name = 'Lambda';
    console.log(event);
    
    if (event.body !== null && event.body !== undefined) {
        let body = event.body;
        console.log(body);
        if (body.name) {
            name = body.name;
        }
        if (body.greet) {
            greet = body.greet;
        }
    }
    const response = {
        statusCode: 200,
        "headers": {
            "content-type": "application/json",
            "Access-Control-Allow-Origin": "*",
            "Access-Control-Allow-Methods": "GET, POST, PUT, DELETE, OPTIONS"
        },
        body: [
            {
                "random": 'You are going to succeed with your goal!!!',
                "message": greet + ", " + name + "!!!",
                "input": event.body
            }
        ],
    };
    return response;
};
