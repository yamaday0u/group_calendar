import React from 'react'

function Footer() {
  return (
    <>
      <footer class="top__page__footer">
        <div class="creator">created by yamaday0u</div>
        <ul class="creator__accounts">
          <li>
            <a href="https://github.com/yamaday0u/group_calendar"　target="_blank" rel="noopener noreferrer" class="account__link">
              <i class="fab fa-github icon"></i>GitHub</a>
          </li>
          <li>
            <a href="https://qiita.com/yamaday0u" target="_blank" rel="noopener noreferrer" class="account__link" >
              <i class="fab fa-quora icon"></i>Qiita</a>
          </li>
          <li>
            <a href="https://twitter.com/yamaday0u" target="_blank" rel="noopener noreferrer" class="account__link" do >
              <i class="fab fa-twitter icon"></i>Twitter</a>
          </li>
          <li>
            <a href="https://t.co/2hjhSR1S4y?amp=1" target="_blank" rel="noopener noreferrer" class="account__link" do >
              <i class="fas fa-blog icon"></i>Blog</a>
          </li>
        </ul>
      </footer>
    </>
  )
}

export default Footer
