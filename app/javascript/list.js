
  document.addEventListener('turbo:load', (event) => {
    document.querySelectorAll('input[type=checkbox]').forEach((checkbox) => {
      checkbox.addEventListener('change', handleCheckboxChange);
    });
  });

  function handleCheckboxChange(event) {
    // IDは'checkbox-3'のような形式なので、'3'の部分を抽出
    const id = event.target.id.split('-')[1];
    const contentElement = document.getElementById('content-' + id);

    if (event.target.checked) {
      // チェックボックスがチェックされた場合の処理
      contentElement.classList.add('checked-class');
    } else {
      // チェックボックスのチェックが外れた場合の処理
      contentElement.classList.remove('checked-class');
    }
  }


  