import React, { useState, useEffect } from 'react'
import axios from 'axios'
import { Switch, Route } from 'react-router-dom'
import RoomIndex from './RoomIndex'
import Room from './Room'

function Rooms() {
  // const [mates, setMates] = useState([])

  // useEffect(() => {
  //   axios.get('/api/v1/rooms')
  //   .then(response => {
  //     console.log(response)
  //     setMates(response.data[0]);
  //   })
  //   .catch(error => {
  //     console.log(error);
  //   })
  // }, [])

  return (
    <>
      <Switch>
        <Route exact path ="/rooms" component={RoomIndex} />
        <Route exact path ="/rooms/:id" component={Room} />
      </Switch>
    </>
  )
}

export default Rooms
