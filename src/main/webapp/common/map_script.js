document.addEventListener('DOMContentLoaded', () => {

    /* ---------- 이름표 ---------- */
    const tagsContainer = document.querySelector('.site-tags-container');
    const allTags = document.querySelectorAll('.site-tag');
    const hiddenInput = document.getElementById('selected-site-type');
	const siteValue = document.querySelector(
	    '.non-floating-bar .info-group2 .value'
	);



    /* ---------- 지도 ---------- */
    const mapPlaceholder = document.querySelector('.map-placeholder');
    const image = document.getElementById('camping-image');

    const areaElements = Array.from(
        document.querySelectorAll('map[name="camping-map"] area')
    );

    const highlightElements = {
        caA: document.getElementById('caA'),
        caB: document.getElementById('caB'),
        caC: document.getElementById('caC')
    };

    /* ---------- 원본 데이터 ---------- */
    let originalImageWidth = 0;

    // area 원본 좌표 저장
    const originalCoords = areaElements.map(area =>
        area.coords.split(',').map(Number)
    );

    /* ---------- 하이라이트 + area 좌표 갱신 ---------- */
    function updatePositions() {
        if (!image.complete || !originalImageWidth) return;

        const scale = image.offsetWidth / originalImageWidth;

        areaElements.forEach((area, idx) => {
            const areaId = area.dataset.areaId; // caA, caB, caC
            const highlight = highlightElements[areaId];

            const scaledCoords = originalCoords[idx].map(v =>
                Math.round(v * scale)
            );

            /* 1️⃣ <area> 클릭 영역 갱신 */
            area.coords = scaledCoords.join(',');

            /* 2️⃣ 하이라이트 위치 계산 */
            if (!highlight) return;

            let minX = Infinity, minY = Infinity;
            let maxX = -Infinity, maxY = -Infinity;

            for (let i = 0; i < scaledCoords.length; i += 2) {
                minX = Math.min(minX, scaledCoords[i]);
                minY = Math.min(minY, scaledCoords[i + 1]);
                maxX = Math.max(maxX, scaledCoords[i]);
                maxY = Math.max(maxY, scaledCoords[i + 1]);
            }

            highlight.style.left = minX + 'px';
            highlight.style.top = minY + 'px';
            highlight.style.width = (maxX - minX) + 'px';
            highlight.style.height = (maxY - minY) + 'px';
        });
    }

    /* ---------- 이미지 로드 ---------- */
    image.addEventListener('load', () => {
        originalImageWidth = image.naturalWidth;
        updatePositions();
    });

    if (image.complete) {
        originalImageWidth = image.naturalWidth;
        updatePositions();
    }

    window.addEventListener('resize', () => {
        updatePositions();
    });

	/* ---------- 이름표 클릭 ---------- */
	tagsContainer.addEventListener('click', e => {
	    const tag = e.target.closest('.site-tag');
	    if (!tag) return;

	    const siteId = tag.dataset.siteId; // A, B, C
	    const siteName = tag.querySelector('.tag-name').textContent;

	    allTags.forEach(t => t.classList.remove('selected'));
	    tag.classList.add('selected');

	    mapPlaceholder.classList.remove('show-caA', 'show-caB', 'show-caC');
	    mapPlaceholder.classList.add(`show-ca${siteId}`);

	    hiddenInput.value = siteName;
		siteValue.textContent = siteName;
		siteValue.classList.add('selected');

		
		updateReserveButton();
		
		console.log(siteValue);
	});
	
    /* ---------- area 클릭 → 이름표 연동 ---------- */
    areaElements.forEach(area => {
        area.addEventListener('click', e => {
            e.preventDefault();

            const areaId = area.dataset.areaId; // caA
            const siteId = areaId.replace('ca', '');

            const tag = document.querySelector(
                `.site-tag[data-site-id="${siteId}"]`
            );

            if (tag) tag.click();
        });
    });

});
