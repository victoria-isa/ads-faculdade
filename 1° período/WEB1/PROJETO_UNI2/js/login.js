// ========================================
// LOGIN.JS - Script de validação do formulário
// Este arquivo será fornecido pronto aos alunos
// ========================================

document.addEventListener('DOMContentLoaded', function() {
  
  // === ELEMENTOS DO DOM ===
  const loginForm = document.getElementById('loginForm');
  const passwordInput = document.getElementById('password');
  const togglePassword = document.getElementById('togglePassword');
  
  
  // === TOGGLE DE SENHA ===
  if (togglePassword && passwordInput) {
    togglePassword.addEventListener('click', function() {
      const type = passwordInput.getAttribute('type') === 'password' ? 'text' : 'password';
      passwordInput.setAttribute('type', type);
      
      // Alternar ícone
      const eyeIcon = togglePassword.querySelector('.eye-icon');
      eyeIcon.textContent = type === 'password' ? '👁️' : '🙈';
    });
  }
  
});
