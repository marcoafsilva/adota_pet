var filter = {
  'color': <String>['Cor', 'Branco', 'Preto', 'Caramelo', 'Mesclado'],
  'size': <String>['Tamanho', 'Pequeno', 'Médio', 'Grande'],
  'age': <String>['Idade', 'Filhote', 'Adulto', 'Idoso'],
};


var geo = {
  'state': <String>['Estado', 'São Paulo'],
  'city': <String>['Cidade', 'Campinas', 'Mogi Guaçu', 'Mogi Mirim', 'Itapira', 'Estiva Gerbi', 'Espírito Santo do Pinhal']
};

bool isFiltering = false;
List filteringFor = [];
