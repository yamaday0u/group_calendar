import React, { Component } from 'react'

export class Top extends Component {
  render() {
    return (
      <div className="content">
        <h1 className="top__page__logo">Welcome To<br /> Group Calendar !!</h1>
        <p className="top__page__explanation">You can manage your schedules & <br class="br-sp" />communicate with...</p>
        <ul className="examples">
          <li>your family</li>
          <li>your friends</li>
          <li>your project team</li>
        </ul>
        <p className="top__page__explanation">in this Group Calendar.</p>

        <div className="lead__to__sign__up">
        <h2 className="subtitle">Let's get started</h2>
        <p>↓  ↓  ↓</p>
        <div className="actions">
          <a href="/users/sign_up" className="sign-up-btn">Sign up</a>
        </div>
        <h2 className="subtitle">or<br />Log in as a guest</h2>
          <div className="actions">
            <a href="/users/guest_log_in" data-method="post" className="sign-up-btn gest__btn">Log in as a guest</a>
          </div>
      </div>
      </div>
    );
  }
}

export default Top
