function fn() {
  var random = Math.floor(Math.random() * 10000);

  return {
    user: {
      nome: 'Automatizador ' + random,
      email: 'automatizador' + random + '@test.com',
      password: '012345',
      administrador: 'false'
    }
  };
}