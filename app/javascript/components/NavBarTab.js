import React from 'react'

function NavBarTab() {
  return (
    <>
      <nav className="nav__bar__tab">
        <ul className="creator__accounts">
          <li>
          <a href="/calendars" className="account__link" >Home</a>
          </li>
          <li>
          <a href="/home/new" className="account__link" >Notification</a>
          </li>
          <li>
          <a href="/rooms" className="account__link" >Chats</a>
          </li>
          <li>
          <a href="/groups" className="account__link" >Groups</a>
          </li>
          <li>
          <a href="/users" className="account__link" >Mates</a>
          </li>
        </ul>
      </nav>
    </>
  )
}

export default NavBarTab
