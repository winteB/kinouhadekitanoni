document.addEventListener('DOMContentLoaded', () => {

    const image = document.getElementById('fishing-image');
    const mapPlaceholder = document.querySelector('.map-placeholder');
	const hiddenInput = document.getElementById('selected-site-type');
    const areas = Array.from(
        document.querySelectorAll('map[name="fishing-map"] area')
    );

    const highlights = {
        fiA: document.getElementById('fiA'),
        fiB: document.getElementById('fiB')
    };

    let originalImageWidth = 0;

    // 원본 좌표 저장
    const originalCoords = areas.map(area =>
        area.coords.split(',').map(Number)
    );

    /* ---------- 좌표 & 하이라이트 갱신 ---------- */
    function updatePositions() {
        if (!image.complete || !originalImageWidth) return;

        const scale = image.offsetWidth / originalImageWidth;

        areas.forEach((area, idx) => {
            const areaId = area.dataset.areaId;
            const highlight = highlights[areaId];
            if (!highlight) return;

            const scaled = originalCoords[idx].map(v =>
                Math.round(v * scale)
            );

            // area 좌표 갱신
            area.coords = scaled.join(',');

            // highlight 위치 계산
            let minX = Infinity, minY = Infinity;
            let maxX = -Infinity, maxY = -Infinity;

            for (let i = 0; i < scaled.length; i += 2) {
                minX = Math.min(minX, scaled[i]);
                minY = Math.min(minY, scaled[i + 1]);
                maxX = Math.max(maxX, scaled[i]);
                maxY = Math.max(maxY, scaled[i + 1]);
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

    window.addEventListener('resize', updatePositions);

    /* ---------- area 클릭 ---------- */
    areas.forEach(area => {
        area.addEventListener('click', e => {
            e.preventDefault();

            const areaId = area.dataset.areaId; // fiA / fiB

            mapPlaceholder.classList.remove('show-fiA', 'show-fiB');
            mapPlaceholder.classList.add(`show-${areaId}`);

            // 선택 값 반영
            const siteName = areaId === 'fiA' ? '얕은 곳' : '깊은 곳';

			const siteValue = document.querySelector(
			    '.non-floating-bar .info-group.site-info .value'
			);

			siteValue.textContent = siteName;
			hiddenInput.value = siteName;
			siteValue.classList.add('selected');


            updateReserveButton(); // 버튼 활성화 체크
        });
    });

});
