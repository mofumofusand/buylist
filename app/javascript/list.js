document.addEventListener('turbo:load', (event) => {
  document.querySelectorAll('input[type=checkbox]').forEach((checkbox) => {
    checkbox.addEventListener('change', handleCheckboxChange);
  });
});

function handleCheckboxChange(event) {
  const id = event.target.id.split('-')[1];
  const contentElement = document.getElementById('content-' + id);

  if (event.target.checked) {
    contentElement.classList.add('checked-class');
  } else {
    contentElement.classList.remove('checked-class');
  }
}

