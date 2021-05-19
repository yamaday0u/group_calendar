import axios from 'axios'
import React, { useState, useEffect } from 'react'

function Rooms() {
  const [mates, setMates] = useState([])

  useEffect(() => {
    axios.get('/api/v1/rooms')
    .then(response => {
      console.log(response)
      setMates(response.data);
    })
    .catch(error => {
      console.log(error);
    })
  }, [])

  return (
    <>
      <div className="list__header">
        <p className="bold">Mate list</p>
      </div>

      <ul>
        <div className="each__item">
          {mates.map((mate, key) =>
            <li key={key}>
              <div className="each__item__content">
                <div className="item__content__left">
                    <p>No<br/>Image</p>
                </div>

                <div className="item__content__right">
                  <p><a href="/users/{mate.id}" >{mate.name}</a></p>
                  <p>{mate.identity}</p>
                </div>
              </div>
              
            </li>
          )}
        </div>
      </ul>
    </>
  )
}

export default Rooms
