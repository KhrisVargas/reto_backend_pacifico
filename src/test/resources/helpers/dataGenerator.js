function fn() {
  var random = Math.floor(Math.random() * 10000);

  return {
    user: {
      nome: 'Cristian ' + random,
      email: 'cristian' + random + '@test.com',
      password: '123456',
      administrador: 'true'
    }
  };
}