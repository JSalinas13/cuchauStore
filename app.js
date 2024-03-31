/**
 * nmp i
 * express
 * dotenv
 * jsonwebtoken
 * md5
 * prisma -D    
 * 
 * npx prisma init
 * npx prisma migrate dev
 */

import express from 'express'
import paisesRoutes from './routes/pais.router.js'
import estadosRoutes from './routes/estado.router.js'
import ciudadesRoutes from './routes/ciudad.router.js'
import usuariosRoutes from './routes/usuario.router.js'
import { authRoutes, validateToken } from './routes/auth.router.js'


const app = express()
const PORT = process.env.PORT || 3001;

app.use(express.urlencoded({ extends: false }))
app.use(express.json())

app.use('/api', authRoutes)
app.use('/api', validateToken, paisesRoutes)
app.use('/api', validateToken, estadosRoutes)
app.use('/api', validateToken, ciudadesRoutes)
app.use('/api', validateToken, usuariosRoutes)



app.listen(PORT, () => console.log(`Example app listening on port ${PORT}!`))