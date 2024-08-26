document.addEventListener('DOMContentLoaded', () => {
    const element = document.querySelector('#myElement');
    if (element) {
        element.textContent = 'Texto modificado por TypeScript';
    }
});
