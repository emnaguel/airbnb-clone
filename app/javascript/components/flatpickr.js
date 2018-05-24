import flatpickr from 'flatpickr'
import 'flatpickr/dist/flatpickr.min.css'
flatpickr(".datepicker", {});
flatpickr("#book-a-boat", {mode: 'range', minDate: "today", enable: [
        function(date) {
            let status = true
            const dates_array = JSON.parse(document.getElementById('book-a-boat').dataset.bookingDates);
            console.log(Date(date));
            dates_array.forEach((dates) => {
              console.log(Date(dates[0]));
              console.log(Date(dates[1]));
              if (Date(date) > Date(dates[0]) && Date(date) < Date(dates[1])) {
                status = false
              }
              });
            console.log(status);
            return status;
        }
    ]});
