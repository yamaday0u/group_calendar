import React from 'react'
import { useLocation } from 'react-router-dom'; //アプリケーションにrouterを導入するためのコンポーネント

function NavBar() {
  const location = useLocation();

  return (
    <>
      <nav class="nav__bar">
  
        <ul class="creator__accounts">
          <li class="nav__bar__list">
            <a herf="/groups(" class="account__link" >
              <i class="fas fa-users icon"></i>
              <p class="icon__text">Groups</p>
            </a>
          </li>
          <li class="nav__bar__list">
            <a href="/users" class="account__link" >
              <i class="fas fa-user icon"></i>
              <p class="icon__text">Mates</p>
            </a>
          </li>

          {/* Switch the btn new_calendar_path, calendars_path & groups_path */}
          
            <li class="nav__bar__list">
              <a href="/calendars" class="account__link" >
                <i class="fas fa-home icon"></i>
                <p class="icon__text">Home</p>
              </a>
            </li>

          {/* Switch the btn new_calendar_path, calendars_path & groups_path */}

          <li class="nav__bar__list">
            <a href="/api/v1/rooms" class="account__link" >
              <i class="fas fa-comments icon"></i>
              <p class="icon__text">Chats</p>
            </a>
          </li>
          <li class="nav__bar__list">
            <a href="/home/new" class="account__link" >
              <i class="fas fa-bell icon"></i>
              <p class="icon__text">Notification</p>
            </a>
          </li>
        </ul>
      </nav>
    </>
  )
}

export default NavBar
