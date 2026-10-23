<?php foreach ($questoes as $index => $p): ?>
    <div class="questao-card">
        <p><strong><?php echo ($index + 1); ?>. <?php echo htmlspecialchars($p->getEnunciado()); ?></strong></p>
        
        <?php 
        $alternativas = $perguntaRepo->buscarAlternativasPorQuestao($p->getId());
        foreach ($alternativas as $alt): 
        ?>
            <label class="alternativa">
                <input type="radio" name="resposta[<?php echo $p->getId(); ?>]" value="<?php echo $alt['letra']; ?>" required>
                <strong><?php echo strtoupper($alt['letra']); ?>)</strong> <?php echo htmlspecialchars($alt['texto']); ?>
            </label>
        <?php endforeach; ?>
    </div>
    <hr>
<?php endforeach; ?>