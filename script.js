// Basic JavaScript for Game Review Site

document.addEventListener('DOMContentLoaded', function() {
    console.log('Game Review Site loaded');

    // Example: Add event listener to review cards
    const reviewCards = document.querySelectorAll('.review-card');
    reviewCards.forEach(card => {
        card.addEventListener('click', function() {
            alert('Review clicked!');
        });
    });
});