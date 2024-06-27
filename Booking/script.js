document.addEventListener("DOMContentLoaded", () => {
  const dateInput = document.getElementById("date");
  const timeSelect = document.getElementById("time");
  const form = document.getElementById("bookingForm");
  const popupModal = document.getElementById("popupModal");
  const popupMessage = document.getElementById("popupMessage");
  const closeBtn = document.getElementsByClassName("close")[0];

  const availableTimes = [
    "09:00 AM - 09:30 AM", "09:30 AM - 10:00 AM", "10:00 AM - 10:30 AM", "10:30 AM - 11:00 AM",
    "11:00 AM - 11:30 AM", "11:30 AM - 12:00 PM", "12:00 PM - 12:30 PM", "12:30 PM - 01:00 PM",
    "02:30 PM - 03:00 PM", "03:00 PM - 03:30 PM", "03:30 PM - 04:00 PM", "04:00 PM - 04:30 PM",
    "04:30 PM - 05:00 PM", "05:00 PM - 05:30 PM", "05:30 PM - 06:00 PM"
  ];

  dateInput.addEventListener("change", (e) => {
    const selectedDate = e.target.value;
    populateTimeSlots(selectedDate);
  });

  const populateTimeSlots = (selectedDate) => {
    timeSelect.innerHTML = "";

    const defaultOption = document.createElement("option");
    defaultOption.value = "";
    defaultOption.innerText = "Select Time";
    defaultOption.disabled = true;
    defaultOption.selected = true;
    timeSelect.appendChild(defaultOption);

    if (!selectedDate) return;

    fetchBookedSlots(selectedDate, (bookedTimes) => {
      availableTimes.forEach(time => {
        const option = document.createElement("option");
        option.value = time;
        option.innerText = time;

        if (bookedTimes.includes(time)) {
          option.disabled = true;
          option.classList.add('booked');
        }

        timeSelect.appendChild(option);
      });
    });
  };

  const fetchBookedSlots = (selectedDate, callback) => {
    const xhr = new XMLHttpRequest();
    xhr.open("GET", "get_booked_times.php?date=" + selectedDate, true);
    xhr.onload = function() {
      if (this.status === 200) {
        const bookedTimes = JSON.parse(this.responseText);
        callback(bookedTimes);
      } else {
        console.error("Error fetching booked slots:", this.statusText);
        callback([]); 
      }
    };
    xhr.send();
  };

  form.addEventListener("submit", (e) => {
    e.preventDefault();
    const formData = new FormData(form);
    const xhr = new XMLHttpRequest();
    xhr.open("POST", "process.php", true);
    xhr.onload = function() {
        const response = JSON.parse(this.responseText);
        if (response.status === "success") {
            const invoice = response.invoice;
            popupMessage.innerHTML = `
                <h2>${response.message}</h2>
                <h3>Booking Details</h3>
                <p>Username: ${invoice.username}</p>
                <p>Service: ${invoice.service}</p>
                <p>Date: ${invoice.date}</p>
                <p>Time: ${invoice.time}</p>
                <p>Contact: ${invoice.contact}</p>
                <button id="printBtn">Print Invoice</button>
            `;
        } else {
            popupMessage.innerText = response.message;
        }
        popupModal.style.display = "block";
    };
    xhr.send(formData);
});

document.addEventListener("click", function(e) {
    if (e.target && e.target.id === "printBtn") {
        window.print();
    }
});

closeBtn.onclick = function() {
    popupModal.style.display = "none";
};

window.onclick = function(event) {
    if (event.target === popupModal) {
        popupModal.style.display = "none";
    }
};

  populateTimeSlots();
});
