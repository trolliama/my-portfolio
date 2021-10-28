const basicAutocomplete = document.querySelector('#search-autocomplete');
const data = ['Python', 'Docker', 'AWS', 'Hacking', 'Five'];
const dataFilter = (value) => {
  return data.filter((item) => {
    return item.toLowerCase().startsWith(value.toLowerCase());
  });
};

new mdb.Autocomplete(basicAutocomplete, {
  filter: dataFilter
});