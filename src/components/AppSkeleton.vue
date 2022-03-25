<template>
  <div class="skeleton">
    <h3 class="title">Please select a character to see information</h3>
    <div class="body">
      <div class="body-head pulse">
        <div class="circle"></div>
        <div class="small-block"></div>
      </div>
      <div class="block pulse"></div>
      <div class="block pulse"></div>
      <div class="block pulse"></div>
    </div>
  </div>
</template>

<script lang="ts"></script>

<style lang="scss" scoped>
$mainColor: #c4c4c4;
.skeleton {
  padding: 25px;
  background: #ffffff;
  box-shadow: 0px 0px 20px rgba(0, 0, 0, 0.25);
}

.title {
  font-weight: 700;
  font-size: 18px;
  text-align: center;
}

.body {
  margin-top: 30px;
  display: flex;
  flex-direction: column;
  gap: 15px;
}

.body-head {
  display: flex;
  align-items: center;
  gap: 9px;
}

.circle {
  background-color: $mainColor;
  flex: 0 0 40px;
  width: 40px;
  height: 40px;
  border-radius: 50%;
}

.small-block {
  flex: 1 0 auto;
  height: 16px;
  background-color: $mainColor;
}

.block {
  height: 35px;
  width: 100%;
  background: $mainColor;
}

.pulse {
  animation: pulse 1s ease infinite alternate-reverse;
}

@keyframes pulse {
  from {
    opacity: 0.3;
  }
  to {
    opacity: 1;
  }
}
</style>
