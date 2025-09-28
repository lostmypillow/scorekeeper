<script setup lang="ts">
import { ref, computed } from "vue";
import { onLongPress } from '@vueuse/core'
const score = ref<number>(0);
const decreaseRef = ref()
const decreaseScore = () => {
  if (score.value !== 0) score.value -= 1;
};
const increaseScore = () => score.value += 1;

// Dynamically choose a font size depending on digit count
const fontSize = computed(() => {
  // Larger for 1–9, smaller for 10+
  const percent = score.value >= 10 ? 90 : 100;
  return `min(${percent}vh, ${percent}vw)`;
});

const resetToZero  = () => score.value = 0

onLongPress(decreaseRef, resetToZero, {
  delay: 2000
})

</script>

<template>
  <div class="flex flex-col h-svh w-svw overflow-hidden bg-red-500">
    <!-- Score fills available space -->
    <div class="flex-[10] flex items-center justify-center overflow-hidden">
      <span
        class="block leading-none text-white"
        :style="{ fontSize }"
      >
        {{ score }}
      </span>
    </div>

    <!-- Buttons at the bottom -->
    <div class="flex flex-row flex-[1]">
      <button class="flex-1 bg-gray-500 text-white text-4xl" @click="decreaseScore" ref="decreaseRef">-</button>
      <button class="flex-1 bg-gray-500 text-white text-4xl" @click="increaseScore">+</button>
    </div>
  </div>
</template>
