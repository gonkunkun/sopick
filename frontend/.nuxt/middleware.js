const middleware = {}

middleware['auth-cookie'] = require('../src/middleware/auth-cookie.js')
middleware['auth-cookie'] = middleware['auth-cookie'].default || middleware['auth-cookie']

export default middleware
