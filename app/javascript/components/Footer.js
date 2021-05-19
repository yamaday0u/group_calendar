import React from 'react'

function Footer() {
  return (
    <>
      <footer className="top__page__footer">
        <div className="creator">created by yamaday0u</div>
        <ul className="creator__accounts">
          <li>
            <a href="https://github.com/yamaday0u/group_calendar" target="_blank" rel="noopener noreferrer" className="account__link">
              <i className="fab fa-github icon"></i>GitHub</a>
          </li>
          <li>
            <a href="https://qiita.com/yamaday0u" target="_blank" rel="noopener noreferrer" className="account__link" >
              <i className="fab fa-quora icon"></i>Qiita</a>
          </li>
          <li>
            <a href="https://twitter.com/yamaday0u" target="_blank" rel="noopener noreferrer" className="account__link" >
              <i className="fab fa-twitter icon"></i>Twitter</a>
          </li>
          <li>
            <a href="https://t.co/2hjhSR1S4y?amp=1" target="_blank" rel="noopener noreferrer" className="account__link" >
              <i className="fas fa-blog icon"></i>Blog</a>
          </li>
        </ul>
      </footer>
    </>
  )
}

export default Footer
