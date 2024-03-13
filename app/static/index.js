const trailer = document.getElementById("follow");

window.onmousemove = (event) => {
    const animationProperties = {
        transform: `translate(${event.clientX - trailer.offsetWidth / 2}px, ${event.clientY - trailer.offsetWidth / 2}px)`
    };
    trailer.animate(animationProperties, { duration: 800, fill: "forwards" });
};

/* ^^ mouse trailer effect ^^ */

const getApi = async (userPassword) => { // Function for getting the API served up by Express 
    try {
        const response = await fetch(`/api`); // fetching the api at route '/api'
        if (!response.ok) {
            throw new Error(`HTTP error! Status: ${response.status}`); // error handling if something goes kerflooey
        }
        const requirements = await response.json(); // getting the json response from the api
        loopedCheck(requirements, userPassword); // calling the looped check function
    } catch (error) {
        console.error('Error fetching API:', error.message); // error handling if something goes kerflooey
    }
};

const loopedCheck = (requirements, userPassword) => {
    const reqElem = document.getElementById('reqs'); // get the HTML element with the id 'reqs'
    reqElem.innerHTML = ''; // Clear previous content

    requirements.forEach(requirement => { /* Loops through the JSON response, and then looks for matches within the userPassword parameter */
        if (requirement && requirement.solutions) { // if matches are found, then it will add the solution to the HTML element with the id 'reqs'
            const match = requirement.solutions.some(v => userPassword.includes(v));
            if (match) {
                console.log(`Match for ${requirement.err || 'Unknown Requirement'}!`); // if match 
            } else {
                console.log(`${requirement.err || 'Unknown Requirement'}.`); // if no match, return the error and append to the HTML element with the id 'reqs'
                const missedReq = document.createElement('p');
                missedReq.innerHTML = `${requirement.err || 'Unknown Requirement'}.`;
                reqElem.appendChild(missedReq);
            }
        }
    });
};

const elem = document.getElementById('input'); // get the HTML element with the id 'input'
elem.addEventListener('input', () => { // this is called everytime a change is registered in the input field
    getApi(elem.value); // calls the getApi function with the value of the input field as the parameter 
});
