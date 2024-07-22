function post (){
  document.querySelectorAll('input[type="checkbox"]').forEach((checkbox) => {
    checkbox.addEventListener('change', function() {
      const label = this.nextElementSibling;
  
      if (this.checked) {
        label.classList.add('strike-through');
      } else {
        label.classList.remove('strike-through');
      }
    });
  });
  console.log("イベント発火");
};

window.addEventListener('turbo:load', post);
window.addEventListener('turbo:click', post);



function getSelectedValues() {
  const selectedValues = [];
  const checkboxes = document.querySelectorAll(
    'input[name="option"]:checked'
  );

  for (let i = 0; i < checkboxes.length; i++) {
    selectedValues.push(checkboxes[i].value);
  }

  return selectedValues;
}

const values = getSelectedValues();
console.log(values);





const checkboxes = document.querySelectorAll(".checkbox");

checkboxes.forEach(checkbox => {
  checkbox.addEventListener('change', function() {
    // 要素のテキスト部分にアクセスするためにlabel要素を使う
    const label = this.parentElement;
    if (this.checked) {
      label.classList.add('strikethrough');
    } else {
      label.classList.remove('strikethrough');
    }
  });
});
