var fpBirth;
var fpMembershipDate;

document.addEventListener('DOMContentLoaded', function() {
    fpBirth = flatpickr(entId("birth"), {
        'monthSelectorType' : 'static',
        "locale": "ko"  // locale for this instance only
    });
    fpMembershipDate = flatpickr(entId("membershipDate"), {
        'monthSelectorType' : 'static',
        "locale": "ko"  // locale for this instance only
    });
});
