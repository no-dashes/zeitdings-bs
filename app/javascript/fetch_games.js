var FetchGames = {
  loadJsonFromServer: function() {
    fetch('/say_something.json')
      .then((data) => data.json())
      .then(FetchGames.handleJsonResult)
  },
  loadFromServer: function() {
    fetch('/say_something')
      .then((data) => data.text())
      .then(FetchGames.handleResult)
  },
  handleResult: function(text) {
    document.getElementById('anotherDiv').setHTML(text);
  },
  handleJsonResult: function(json) {
    debugger;
  },
  init: function() {
    const fetchBtn = document.getElementById('fetchBtn');
    fetchBtn.addEventListener('click', FetchGames.loadFromServer);
    const fetchJsonBtn = document.getElementById('fetchJsonBtn');
    fetchJsonBtn.addEventListener('click', FetchGames.loadJsonFromServer);
  }
};
export default FetchGames;
