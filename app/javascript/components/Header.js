import React from 'react'

function Header(props) {
  return (
    <>
      <header className="top__page__header">
        <div className="header__band">
          {
            props.current_user?
            (
            <div>
              <ul className="user__options">
              <li><a href="/users/{props.current_user.id}" className="logged__in__user">Hi, {props.current_user.name}</a></li>
              <li><a href="/users/sign_out" rel="nofollow"  data-method="delete" className="user__option">Log out</a></li>
              </ul>
            </div>
            )
            :
            (
            <div>
              <ul className="user__options">
              <li><a href="/users/sign_in" className="user__option">Log in</a></li>
              <li><a href="/users/sign_up" className="user__option">Sign up</a></li>
              </ul>
            </div>
            )
          }
        </div>
      </header>
    </>
  )
}

export default Header
