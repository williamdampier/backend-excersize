require('dotenv').config()
const express = require('express');
const app = express();
const userRouter = require('./routes/user.routes')
const groupRouter = require('./routes/group.router')
const PORT = process.env.PORT || 3000;
// app.use('router.js')


app.use(express.json());
app.use('/api', userRouter);
app.use('/api', userRouter);




function startApp() {
    try {
        app.listen(PORT, () => {
            console.log(`App works on port: ${PORT}`);
        })
     
    }
    catch(e){
        console.log(e)
    }
}

startApp();