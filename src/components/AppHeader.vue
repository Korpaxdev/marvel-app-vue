<template>
  <header>
    <div class="container">
      <nav class="nav">
        <a href="#" class="logo fz-28"
          ><span>Marvel</span> information portal</a
        >
        <ul class="menu fz-24">
          <li class="menu-list">
            <router-link to="/" class="menu-link">Characters</router-link>
          </li>
          <li class="menu-list">
            <router-link to="/comics" class="menu-link">Comics</router-link>
          </li>
        </ul>
      </nav>
    </div>
  </header>
</template>

<script lang="ts"></script>
<style scoped lang="scss">
@import 'src/sass/variables';

.nav {
  display: flex;
  align-items: center;
  height: 100px;
  padding: 10px 0;
  justify-content: space-between;
}

.logo {
  font-weight: 700;
  &:hover {
    color: #000;
  }

  span {
    font-weight: inherit;
    color: $primary;
  }
}

.menu {
  list-style: none;
  display: flex;
}

.menu-list {
  &:not(:last-child) {
    &:after {
      content: '/';
      margin: 0 8px;
    }
  }
}

.menu-link {
  font-weight: 700;
}
</style>
