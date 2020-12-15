import $ from 'jquery';
import 'select2';

const transform = () => {
  $('.select2').select2({
    theme: "bootstrap4"
  }); // (~ document.querySelectorAll)
}

const initSelect2 = () => {
  transform();
  window.setTimeout(transform, 200);
};

export { initSelect2 };
