// ========================================
// MODAL.JS - Script para controle do modal
// Este arquivo será fornecido pronto aos alunos
// ========================================

document.addEventListener('DOMContentLoaded', function() {
  
  // === ELEMENTOS DO DOM ===
  const aboutBtn = document.getElementById('aboutBtn');
  const modal = document.getElementById('modalAbout');
  const modalCloseBtn = document.getElementById('modalCloseBtn');
  
  // === ABRIR MODAL ===
  if (aboutBtn) {
    aboutBtn.addEventListener('click', function() {
      openModal();
    });
  }
  
  // === FECHAR MODAL (Botão X) ===
  if (modalCloseBtn) {
    modalCloseBtn.addEventListener('click', function() {
      closeModal();
    });
  }
   
  // === FECHAR MODAL (Tecla ESC) ===
  document.addEventListener('keydown', function(event) {
    if (event.key === 'Escape' && modal.classList.contains('active')) {
      closeModal();
    }
  });
  
  // === FUNÇÕES ===
  
  function openModal() {
    modal.classList.add('active');
    modal.setAttribute('aria-hidden', 'false');
    document.body.style.overflow = 'hidden'; // Prevenir scroll do body
    modalCloseBtn.focus(); // Focar no botão de fechar
  }
  
  function closeModal() {
    modal.classList.remove('active');
    modal.setAttribute('aria-hidden', 'true');
    document.body.style.overflow = ''; // Restaurar scroll
    aboutBtn.focus(); // Retornar foco ao botão que abriu
  }
  
});
