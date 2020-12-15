import { Controller } from "stimulus"

export default class extends Controller {
  static targets = [ 'many', 'few', 'none' ]
  user_has_voted = false;
  last_voted = Date.now;
  button_pressed = '';
  
  connect(){
    this.user_has_voted = JSON.parse(localStorage.getItem('user_has_voted'));
    this.last_voted = JSON.parse(localStorage.getItem('last_voted'));
    this.button_pressed = JSON.parse(localStorage.getItem('button_pressed'))
    this.reset_buttons(this.button_pressed);
  }
  
  reset_buttons(button){
    if(button === 'many'){
      this.fewTarget.disabled = false;
      this.noneTarget.disabled = false;
    }else if(button === 'few'){
      this.manyTarget.disabled = false;
      this.noneTarget.disabled = false;
    }else if(button === 'none'){
      this.fewTarget.disabled = false;
      this.manyTarget.disabled = false;
    }
    this.timer()
  }

  timer(){
    if(Date.now() > (this.last_voted + 60000)){
      this.fewTarget.disabled = false;
      this.noneTarget.disabled = false;
      this.manyTarget.disabled = false;
    }
  }



  barId(){
    return document.getElementById('hidden_id').dataset.barId
  }

  token(){
    return document.querySelector('meta[name=csrf-token]').getAttribute('content')
  }

  voted(button){
    window.localStorage.setItem('user_has_voted', JSON.stringify(true))
    window.localStorage.setItem('last_voted', JSON.stringify(Date.now()))
    window.localStorage.setItem('button_pressed', JSON.stringify(button))
  }
  
  manyStatus(e, id) {
    fetch(`/bars/${this.barId()}/color_vote`, { method: 'POST', body: JSON.stringify({ color: 'green' }), headers: { "X-CSRF-Token": this.token(), "Content-Type": 'application/json', "Accept": "application/json" }})
    .then((res) => res.json())
    .then(data => { 
      this.fewTathis.manyTarget.disabled = true;
      this.noneTarget.disabled = true;rget.disabled = true;
      this.noneTarget.disabled = true;
      this.voted('many')
      console.log(this.last_voted)
     })
  }

  fewStatus(e, id) {
    fetch(`/bars/${this.barId()}/color_vote`, { method: 'POST', body: JSON.stringify({ color: 'yellow' }), headers: { "X-CSRF-Token": this.token(), "Content-Type": 'application/json', "Accept": "application/json" }})
    .then((res) => res.json())
    .then(data => { 
      this.manyTarget.disabled = true;
      this.noneTarget.disabled = true;
      this.voted('few')
     })
  }

  noneStatus(e, id) {
    fetch(`/bars/${this.barId()}/color_vote`, { method: 'POST', body: JSON.stringify({ color: 'red' }), headers: { "X-CSRF-Token": this.token(), "Content-Type": 'application/json', "Accept": "application/json" }})
    .then((res) => res.json())
    .then(data => { 
      this.fewTarget.disabled = true;
      this.manyTarget.disabled = true;
      this.voted('none')
     })
  }
}