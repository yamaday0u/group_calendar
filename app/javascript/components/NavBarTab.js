import React from 'react'

function NavBarTab() {
  return (
    <>
      <nav class="nav__bar__tab">
        <ul class="creator__accounts">
          <li>
          <a href="/calendars" class="account__link" >Home</a>
          </li>
          <li>
          <a href="/home/new" class="account__link" >Notification</a>
          </li>
          <li>
          <a href="/api/v1/rooms" class="account__link" >Chats</a>
          </li>
          <li>
          <a herf="/groups(" class="account__link" >Groups</a>
          </li>
          <li>
          <a href="/users" class="account__link" >Mates</a>
          </li>
        </ul>
      </nav>
    </>
  )
}

export default NavBarTab
