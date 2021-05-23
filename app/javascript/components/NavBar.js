import React from 'react'
import { useLocation } from 'react-router-dom'; //アプリケーションにrouterを導入するためのコンポーネント

function NavBar() {
  const location = useLocation();

  return (
    <>
      <nav className="nav__bar">
  
        <ul className="creator__accounts">
          <li className="nav__bar__list">
            <a href="/groups(" className="account__link" >
              <i className="fas fa-users icon"></i>
              <p className="icon__text">Groups</p>
            </a>
          </li>
          <li className="nav__bar__list">
            <a href="/users" className="account__link" >
              <i className="fas fa-user icon"></i>
              <p className="icon__text">Mates</p>
            </a>
          </li>

          {/* Switch the btn new_calendar_path, calendars_path & groups_path */}
          
            <li className="nav__bar__list">
              <a href="/calendars" className="account__link" >
                <i className="fas fa-home icon"></i>
                <p className="icon__text">Home</p>
              </a>
            </li>

          {/* Switch the btn new_calendar_path, calendars_path & groups_path */}

          <li className="nav__bar__list">
            <a href="rooms" className="account__link" >
              <i className="fas fa-comments icon"></i>
              <p className="icon__text">Chats</p>
            </a>
          </li>
          <li className="nav__bar__list">
            <a href="/home/new" className="account__link" >
              <i className="fas fa-bell icon"></i>
              <p className="icon__text">Notification</p>
            </a>
          </li>
        </ul>
      </nav>
    </>
  )
}

export default NavBar
