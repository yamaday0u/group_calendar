import React from 'react'
import Room from './Room'
import NavBar from './NavBar'
import NavBarTab from './NavBarTab'

function Body() {
  return (
    <>
      <div class="content">
        <div class="flex__parent__wrap">
          <div class="main">

            <Room />

          </div>{/* end of main */}

          <NavBarTab/>
        </div>{/* end of flex-parent-wrap */}
      </div>{/* end of content */}
      <NavBar/>
    </>
  )
}

export default Body
