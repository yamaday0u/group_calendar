import React from 'react'
import Rooms from './Rooms'
import NavBar from './NavBar'
import NavBarTab from './NavBarTab'

function Body() {
  return (
    <>
      <div className="content">
        <div className="flex__parent__wrap">
          <div className="main">

            <Rooms />

          </div>{/* end of main */}

          <NavBarTab/>
        </div>{/* end of flex-parent-wrap */}
      </div>{/* end of content */}
      <NavBar/>
    </>
  )
}

export default Body
