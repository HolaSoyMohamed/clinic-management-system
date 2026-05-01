function updateTime() {
const clockElement = document.getElementById('clock');
const now = new Date();

let hours = now.getHours();
const minutes = now.getMinutes().toString().padStart(2, '0');
const ampm = hours >= 12 ? 'PM' : 'AM';

hours = hours % 12;
hours = hours ? hours : 12;

const currentTime = hours + ':' + minutes + ' ' + ampm;

clockElement.innerText = currentTime;
}

setInterval(updateTime, 1000);

updateTime();